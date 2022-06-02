class User < ApplicationRecord
    has_and_belongs_to_many :parking_slots, :join_table => :users_slots
    has_one :parking_slot
end
