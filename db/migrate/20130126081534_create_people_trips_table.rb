class CreatePeopleTripsTable < ActiveRecord::Migration
  def up
    create_table :people_trips, id: false do |t|
      t.references :trip
      t.references :person
    end
    add_index :people_trips, [:trip_id, :person_id]
    add_index :people_trips, [:person_id, :trip_id]
  end

  def down
    drop_table :people_trips
  end
end
