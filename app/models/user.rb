class User < ApplicationRecord
    has_and_belongs_to_many :parking_slots, :join_table => :users_slots
    has_one :parking_slot
    has_secure_password
    has_secure_token

    validates :name, presence: true, length: { in: 3..50 }
    validates :surname, presence: true, length: { in: 3..50 }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
    validates :phone_number, phone: true
    validates :password, presence: true, length: { minimum: 6 }

    def books?(parking_slot)
        self.parking_slots.include?(parking_slot)
    end

    def invalidate_token
        self.update_columns(token: nil)
    end
end
