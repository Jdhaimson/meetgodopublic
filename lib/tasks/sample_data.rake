namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(email: "example@example.com",
                 password: "password",
                 password_confirmation: "password")
    500.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@example.com"
      password  = "password"
      u = User.create!(email: email, password: "password", password_confirmation: "password")
      p = u.people.create(name: name, is_primary: true )
      p.person_survey=PersonSurvey.create(birthday: "1983-01-20 16:33:26 -0500",
                                         gender: "male",
                                         relationship_status: "single",
                                         language: "english",
                                         profession: "Dock Worker",
                                         outdoor_interest: rand(1..10),
                                         fitness_interest: rand(1..10),
                                         food_interest: rand(1..10),
                                         art_interest: rand(1..10),
                                         music_interest: rand(1..10),
                                         siteseeing_interest: rand(1..10),
                                         film_interest: rand(1..10),
                                         game_interest: rand(1..10),
                                         stem_interest: rand(1..10),
                                         politics_interest: rand(1..10),
                                         people_score: rand(1..10),
                                         infoprocessing_score: rand(1..10),
                                         decisionmaking_score: rand(1..10),
                                         structure_score: rand(1..10))
    end
  end
end
