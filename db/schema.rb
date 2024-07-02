# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_07_02_031639) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: 6, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "hotel_id", null: false
    t.date "check_in_date"
    t.date "check_out_date"
    t.integer "room_type_id", null: false
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hotel_id"], name: "index_bookings_on_hotel_id"
    t.index ["room_type_id"], name: "index_bookings_on_room_type_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "hotel_name"
    t.text "description"
    t.string "location"
    t.string "contact_details"
    t.text "amenities"
    t.text "photo_gallery"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "hotel_id", null: false
    t.integer "rating"
    t.text "comment"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hotel_id"], name: "index_reviews_on_hotel_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "room_types", force: :cascade do |t|
    t.integer "hotel_id", null: false
    t.string "type"
    t.text "description"
    t.integer "capacity"
    t.decimal "price_per_night"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hotel_id"], name: "index_room_types_on_hotel_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "mobile_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "hotels"
  add_foreign_key "bookings", "room_types"
  add_foreign_key "bookings", "users"
  add_foreign_key "reviews", "hotels"
  add_foreign_key "reviews", "users"
  add_foreign_key "room_types", "hotels"
  add_foreign_key "user_roles", "users"
end
