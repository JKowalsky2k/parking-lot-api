class CreateUsersSlotsFixed < ActiveRecord::Migration[5.2]
  def change
    create_table :users_slots, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :parking_slot, index: true
    end
  end
end
