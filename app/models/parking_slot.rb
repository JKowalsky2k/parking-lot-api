class ParkingSlot < ApplicationRecord
    has_and_belongs_to_many :users, :join_table => :users_slots
    has_and_belongs_to_many :parkings, :join_table => :parkings_slots
    has_one :user
    #has_one :parking 

    validates :position, presence: true, uniqueness: true
end
