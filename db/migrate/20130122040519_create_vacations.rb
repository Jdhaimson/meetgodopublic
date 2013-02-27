class CreateVacations < ActiveRecord::Migration
  def change
    create_table :vacations do |t|
      t.date :date_start
      t.date :date_end
      t.string :location
      t.string :name
      t.references :user

      t.timestamps
    end
    add_index :vacations, :user_id
  end
end
