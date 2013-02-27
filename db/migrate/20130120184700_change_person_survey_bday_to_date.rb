class ChangePersonSurveyBdayToDate < ActiveRecord::Migration
  def up
    change_column :person_surveys, :birthday, :date
  end

  def down
    change_column :person_surveys, :birthday, :datetime
  end
end
