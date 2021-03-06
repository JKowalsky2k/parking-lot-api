# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_04_154016) do

  create_table "parking_slots", force: :cascade do |t|
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parkings", force: :cascade do |t|
    t.string "city"
    t.string "street"
    t.string "address_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parkings_slots", id: false, force: :cascade do |t|
    t.integer "parking_id"
    t.integer "parking_slot_id"
    t.index ["parking_id"], name: "index_parkings_slots_on_parking_id"
    t.index ["parking_slot_id"], name: "index_parkings_slots_on_parking_slot_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["token"], name: "index_users_on_token"
  end

  create_table "users_slots", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "parking_slot_id"
    t.index ["parking_slot_id"], name: "index_users_slots_on_parking_slot_id"
    t.index ["user_id"], name: "index_users_slots_on_user_id"
  end

end
