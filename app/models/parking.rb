class Parking < ApplicationRecord
    has_and_belongs_to_many :parking_slots, :join_table => :parkings_slots
    #has_many :parking_slots

    validates :city, presence: true
    validates :street, presence: true
    validates :address_number, presence: true

    def adds?(parking_slot)
        Parking.all[0].parking_slots.include?(parking_slot)
    end
end
