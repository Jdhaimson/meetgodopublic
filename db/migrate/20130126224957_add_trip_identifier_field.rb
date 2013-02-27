class AddTripIdentifierField < ActiveRecord::Migration
  def change
    add_column :trips, :trip_identifier, :string
  end
end
