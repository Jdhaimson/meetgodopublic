class RemoveNameFromTrips < ActiveRecord::Migration
  def up
    remove_column :trips, :name
  end

  def down
    add_column :trips, :name, :string
  end
end
