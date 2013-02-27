class ChangeTripSurveyInterestFields < ActiveRecord::Migration
  def up
    remove_column :trip_surveys, :top_interests
    add_column :trip_surveys, :top_interest1, :string
    add_column :trip_surveys, :top_interest2, :string
    add_column :trip_surveys, :top_interest3, :string
  end

  def down
    add_column :trip_surveys, :top_interests, :string
    remove_column :trip_surveys, :top_interest1
    remove_column :trip_surveys, :top_interest2
    remove_column :trip_surveys, :top_interest3 
  end
end
