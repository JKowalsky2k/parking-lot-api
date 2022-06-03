# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create(
    [
      {
        name: 'Jedrzej',
        surname: 'Kowalski',
        email: 'jedrzej@kowalski',
        phone_number: '123456789',
        password: 'qwerty'
      },
      {
        name: 'Merek',
        surname: 'Gnyp',
        email: 'marek@gnyp',
        phone_number: '123456789',
        password: 'qwerty'
      }
    ]
  )

  parking_slots = ParkingSlot.create(
    [
      {
        position: 1
      },
      {
        position: 2
      }
    ]
  )

  parkings = Parking.create(
    [
      {
        city: 'Wroclaw',
        street: 'Wroblewskiego',
        address_number: '25'
      }
    ]
  )
