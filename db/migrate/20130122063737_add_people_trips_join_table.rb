class AddPeopleTripsJoinTable < ActiveRecord::Migration
  def up
    create_table :people_trips, id: false do |t|
      t.integer :person_id
      t.integer :trip_id
    end
  end

  def down
    drop_table :people_trips
  end
end
