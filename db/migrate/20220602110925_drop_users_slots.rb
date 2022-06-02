class DropUsersSlots < ActiveRecord::Migration[5.2]
  def change
    drop_table :users_slots
  end
end
