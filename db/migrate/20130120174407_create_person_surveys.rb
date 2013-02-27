class CreatePersonSurveys < ActiveRecord::Migration
  def change
    create_table :person_surveys do |t|
      t.datetime :birthday
      t.string :gender
      t.string :relationship_status
      t.string :language
      t.string :profession
      t.integer :outdoor_interest
      t.integer :fitness_interest
      t.integer :food_interest
      t.integer :art_interest
      t.integer :music_interest
      t.integer :siteseeing_interest
      t.integer :film_interest
      t.integer :game_interest
      t.integer :stem_interest
      t.integer :politics_interest
      t.integer :people_score
      t.integer :infoprocessing_score
      t.integer :decisionmaking_score
      t.integer :structure_score
      t.references :person

      t.timestamps
    end
    add_index :person_surveys, :person_id
  end
end
