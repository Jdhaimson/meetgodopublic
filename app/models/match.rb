class Match

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :group

  def find_matches(trip_id, group = [])
    #get everybody on the vacation
    people_on_trip = []
    travel_group = []
    vacation = Trip.find(trip_id).vacation
    trips = vacation.trips
    trips.each do |trip|
      people_on_trip += trip.people
    end
    
    #create array of travel group
    group.each do |pid|
      travel_group += [Person.find(pid)]
    end

    #don't search through group that's already traveling together
    people_on_trip -= travel_group

    results = []
    count1 = 0
    travel_group.each do |person1|
      results[count1] = []
      count2 = 0
      people_on_trip.each do |person2|
        results[count1][count2] = match_score(person1, person2, trip_id)
        count2 += 1
      end
      count1 += 1
    end

    return results

  end

=begin
  Algorithm which determines how well two people match
  Input: p1-Person object p2-Different Person object,
  trip_id-Integer indicating which trip the match is for (person1's trip, it will calculate for person 2)
  Output: match_percentage-Float which is the percentage match between people
=end
  def match_score(p1, p2, trip_id)
    #get survey information required for match score
    p1survey = p1.person_survey
    t1survey = p1.trip_surveys.find(:first, conditions: {trip_id: trip_id})

    p2survey = p2.person_survey
	p2user = p2.user
    #find person 2's trip for this vacation
    trip_id2 = nil
    vacation = Trip.find(trip_id).vacation
    vacation.trips.each do |trip|
      trip.people.each do |person|
        if person == p2
          trip_id2 = trip.id
        end
      end
    end
    t2survey = TripSurvey.find(trip_id2)

    #Personality Score
    personality_diff = (p1survey.people_score - p2survey.people_score).abs + \
                       (p1survey.infoprocessing_score - p2survey.infoprocessing_score).abs + \
                       (p1survey.decisionmaking_score - p2survey.decisionmaking_score).abs + \
                       (p1survey.structure_score - p2survey.structure_score).abs 
    personality_percentage = 1.0 - (personality_diff/40.0)

    #Basic Interest Score
    basic_interest_diff = (p1survey.outdoor_interest - p2survey.outdoor_interest).abs + \
                          (p1survey.fitness_interest - p2survey.fitness_interest).abs + \
                          (p1survey.food_interest - p2survey.food_interest).abs + \
                          (p1survey.art_interest - p2survey.art_interest).abs + \
                          (p1survey.music_interest - p2survey.music_interest).abs + \
                          (p1survey.siteseeing_interest - p2survey.siteseeing_interest).abs + \
                          (p1survey.film_interest - p2survey.film_interest).abs + \
                          (p1survey.game_interest - p2survey.game_interest).abs + \
                          (p1survey.stem_interest - p2survey.stem_interest).abs + \
                          (p1survey.politics_interest - p2survey.politics_interest).abs
    basic_interest_percentage =  1.0 - (basic_interest_diff/45.0)

    #Trip Interest Score
    trip_diff = (t1survey.relaxing_interest - t2survey.relaxing_interest).abs + \
                (t1survey.sightseeing_interest - t2survey.sightseeing_interest).abs + \
                (t1survey.fitness_interest - t2survey.fitness_interest).abs + \
                (t1survey.meetingpeople_interest - t2survey.meetingpeople_interest).abs + \
                (t1survey.adventuring_interest - t2survey.adventuring_interest).abs + \
                (t1survey.food_interest - t2survey.food_interest).abs + \
                (t1survey.games_interest - t2survey.games_interest).abs
    trip_percentage = 1.0 - (trip_diff/28.0)

    #Scaling
    p1age = (Time.now - p1survey.birthday.to_datetime)
    p2age = (Time.now - p2survey.birthday.to_datetime)
    if p1age > p2age
      younger_age = p2age
      older_age = p1age
    else
      younger_age = p1age
      older_age = p2age
    end
    age_scaling = younger_age/older_age

    total_percentage = (trip_percentage*0.5) + \
                       (basic_interest_percentage*0.2) + \
                       (personality_percentage*0.3)
    scaled_percentage = (total_percentage*age_scaling)

#Ghetto breakpoint, remove to let it run   
#nil.to_datetime

    return [p2, scaled_percentage, p2age, t2survey.goal, t2survey.top_interest2, t2survey.top_interest1, t2survey.top_interest3, p2user.email]
  end

  def initialize(group = [])
    @group = group
  end

  def persisted?
    false
  end

end
