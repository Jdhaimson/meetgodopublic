# == Schema Information
#
# Table name: trip_surveys
#
#  id                     :integer          not null, primary key
#  goal                   :string(255)
#  relaxing_interest      :integer
#  sightseeing_interest   :integer
#  fitness_interest       :integer
#  food_interest          :integer
#  meetingpeople_interest :integer
#  adventuring_interest   :integer
#  games_interest         :integer
#  trip_id                :integer
#  person_id              :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  top_interest1          :string(255)
#  top_interest2          :string(255)
#  top_interest3          :string(255)
#

class TripSurvey < ActiveRecord::Base
  belongs_to :trip
  belongs_to :person
  attr_accessible :adventuring_interest, :fitness_interest, :food_interest, :games_interest, :goal, :meetingpeople_interest, :relaxing_interest, :sightseeing_interest, :top_interest1, :top_interest2, :top_interest3 
end
