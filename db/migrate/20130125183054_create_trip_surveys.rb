class CreateTripSurveys < ActiveRecord::Migration
  def change
    create_table :trip_surveys do |t|
      t.string :goal
      t.string :top_interests
      t.integer :relaxing_interest
      t.integer :sightseeing_interest
      t.integer :fitness_interest
      t.integer :food_interest
      t.integer :meetingpeople_interest
      t.integer :adventuring_interest
      t.integer :games_interest
      t.references :trip
      t.references :person

      t.timestamps
    end
    add_index :trip_surveys, :trip_id
    add_index :trip_surveys, :person_id
  end
end
