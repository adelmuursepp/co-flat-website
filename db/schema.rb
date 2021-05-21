# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_06_151847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "apartments", force: :cascade do |t|
    t.string "name", default: ""
    t.string "intro", default: ""
    t.string "description", default: ""
    t.string "date", default: ""
    t.string "main_photo", default: ""
    t.float "latitude"
    t.float "longitude"
    t.integer "deposit", default: 0
    t.string "available", default: ""
    t.integer "minimum_stay_in_months", default: 1
    t.integer "room_size_m2", default: 0
    t.integer "apartment_size_m2", default: 0
    t.string "bed_type", default: ""
    t.integer "bathrooms_number", default: 0
    t.integer "flatmates_female", default: 0
    t.integer "flatmates_male", default: 0
    t.integer "min_preferred_flatmate_age", default: 18
    t.integer "max_preferred_flatmate_age", default: 0
    t.boolean "preferred_flatmate_is_male", default: true
    t.boolean "preferred_flatmate_is_female", default: true
    t.boolean "is_wifi", default: false
    t.boolean "is_tv", default: false
    t.boolean "is_washing_machine", default: false
    t.boolean "is_lift", default: false
    t.boolean "is_furniture", default: false
    t.boolean "is_terrace", default: false
    t.boolean "is_balcony", default: false
    t.boolean "is_garden", default: false
    t.boolean "is_parking", default: false
    t.boolean "is_private_bathroom", default: false
    t.boolean "is_dishwasher", default: false
    t.boolean "is_pet_friendly", default: false
    t.boolean "is_smoker_friendly", default: false
    t.boolean "is_couples_friendly", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "propertytype", default: ""
    t.string "address", default: ""
    t.integer "rent_cents", default: 0, null: false
    t.string "status", default: "active"
    t.bigint "user_id"
    t.string "city", default: ""
    t.string "neighborhood", default: ""
    t.string "preferred_gender", default: "Ei oma tähtsust"
    t.integer "bedroomnumber", default: 1
    t.integer "bathroomnumber", default: 1
    t.boolean "is_desk", default: false
    t.integer "maximum_stay_in_months", default: 12
    t.string "available_until", default: ""
    t.boolean "show_address", default: false
    t.boolean "is_bookable", default: false
    t.string "room_type", default: ""
    t.index ["user_id"], name: "index_apartments_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "state"
    t.string "checkout_session_id"
    t.bigint "user_id", null: false
    t.bigint "apartment_id", null: false
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "EUR", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description", default: ""
    t.integer "status", default: 0
    t.index ["apartment_id"], name: "index_bookings_on_apartment_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "apartment_id", null: false
    t.integer "identifier"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "notice_type"
    t.string "description"
    t.boolean "read", default: false
    t.index ["apartment_id"], name: "index_notifications_on_apartment_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "apartment_id", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "price"
    t.integer "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["apartment_id"], name: "index_reservations_on_apartment_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description", default: ""
    t.string "name"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "provider"
    t.string "uid"
    t.string "image"
    t.string "phone"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "apartments", "users"
  add_foreign_key "bookings", "apartments"
  add_foreign_key "bookings", "users"
  add_foreign_key "notifications", "apartments"
  add_foreign_key "notifications", "users"
  add_foreign_key "reservations", "apartments"
  add_foreign_key "reservations", "users"
end
