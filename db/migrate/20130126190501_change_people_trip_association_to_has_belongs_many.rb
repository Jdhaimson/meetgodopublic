class ChangePeopleTripAssociationToHasBelongsMany < ActiveRecord::Migration
  def change
    drop_table :trips_people
    remove_column :trips, :person_id
    create_table :people_trips, id: false, force: true do |t|
      t.integer "person_id"
      t.integer "trip_id"
    end
    add_index :people_trips, :person_id
    add_index :people_trips, :trip_id
  end
end
