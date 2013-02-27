class AddUserPersonAssociations < ActiveRecord::Migration
  def change
    add_column :people, :user_id, :integer
    add_index :people, :user_id
    add_column :people, :is_primary, :boolean
  end
end
