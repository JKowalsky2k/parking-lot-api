class CreateUsersSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :users_slots, id: false do |t|
      t.belongs_to :users, index: true
      t.belongs_to :parking_slots, index: true
    end
  end
end
