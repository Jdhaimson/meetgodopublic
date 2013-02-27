class CreateTripCodes < ActiveRecord::Migration
  def change
    create_table :trip_codes do |t|
      t.string :code
      t.integer :vacation_id
      t.integer :trip_id

      t.timestamps
    end
  end
end
