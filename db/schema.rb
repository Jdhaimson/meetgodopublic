# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130126224957) do

  create_table "people", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.boolean  "is_primary"
  end

  add_index "people", ["user_id"], :name => "index_people_on_user_id"

  create_table "people_trips", :id => false, :force => true do |t|
    t.integer "person_id"
    t.integer "trip_id"
  end

  add_index "people_trips", ["person_id"], :name => "index_people_trips_on_person_id"
  add_index "people_trips", ["trip_id"], :name => "index_people_trips_on_trip_id"

  create_table "person_surveys", :force => true do |t|
    t.date     "birthday"
    t.string   "gender"
    t.string   "relationship_status"
    t.string   "language"
    t.string   "profession"
    t.integer  "outdoor_interest"
    t.integer  "fitness_interest"
    t.integer  "food_interest"
    t.integer  "art_interest"
    t.integer  "music_interest"
    t.integer  "siteseeing_interest"
    t.integer  "film_interest"
    t.integer  "game_interest"
    t.integer  "stem_interest"
    t.integer  "politics_interest"
    t.integer  "people_score"
    t.integer  "infoprocessing_score"
    t.integer  "decisionmaking_score"
    t.integer  "structure_score"
    t.integer  "person_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "person_surveys", ["person_id"], :name => "index_person_surveys_on_person_id"

  create_table "trip_codes", :force => true do |t|
    t.string   "code"
    t.integer  "vacation_id"
    t.integer  "trip_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "trip_surveys", :force => true do |t|
    t.string   "goal"
    t.integer  "relaxing_interest"
    t.integer  "sightseeing_interest"
    t.integer  "fitness_interest"
    t.integer  "food_interest"
    t.integer  "meetingpeople_interest"
    t.integer  "adventuring_interest"
    t.integer  "games_interest"
    t.integer  "trip_id"
    t.integer  "person_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "top_interest1"
    t.string   "top_interest2"
    t.string   "top_interest3"
  end

  add_index "trip_surveys", ["person_id"], :name => "index_trip_surveys_on_person_id"
  add_index "trip_surveys", ["trip_id"], :name => "index_trip_surveys_on_trip_id"

  create_table "trips", :force => true do |t|
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "trip_identifier"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "vacations", :force => true do |t|
    t.date     "date_start"
    t.date     "date_end"
    t.string   "location"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "vacations", ["user_id"], :name => "index_vacations_on_user_id"

end
