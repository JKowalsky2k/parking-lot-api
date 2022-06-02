class ParkingSlot < ApplicationRecord
    has_and_belongs_to_many :users, :join_table => :users_slots
    has_one :user
    
    validates :position, presence: true, uniqueness: true
end
