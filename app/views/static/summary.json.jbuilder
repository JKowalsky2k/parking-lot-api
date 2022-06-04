json.name current_user.name
json.surname current_user.surname
json.email current_user.email
json.phone_number current_user.phone_number

json.parking_slots current_user.parking_slots do |parking_slot|
    json.id parking_slot.id
    json.position parking_slot.position
end