module ParkingSlotsHelper
    def parking_slot_available?(p_slot_id)
        @can_be_book = true
        User.all.each do |u|
          u.parking_slots.each do |p_slot|
            if p_slot.id == p_slot_id
              @can_be_book = false
            end
          end
        end
        @can_be_book
    end
end
