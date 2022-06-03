class CreateParkingsSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :parkings_slots, id: false do |t|
      t.belongs_to :parking, index: true
      t.belongs_to :parking_slot, index: true
    end
  end
end
