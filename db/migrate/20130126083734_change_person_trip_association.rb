class ChangePersonTripAssociation < ActiveRecord::Migration
  def change
    drop_table :people_trips
    add_column :trips, :person_id, :integer
  end
end
