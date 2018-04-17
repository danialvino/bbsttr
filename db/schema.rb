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

ActiveRecord::Schema.define(version: 20180417164346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availables", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "sitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sitter_id"], name: "index_availables_on_sitter_id"
  end

  create_table "bank_infos", force: :cascade do |t|
    t.string "agency"
    t.string "account"
    t.string "bank"
    t.string "cpf"
    t.bigint "sitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sitter_id"], name: "index_bank_infos_on_sitter_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "sitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.bigint "user_id"
    t.datetime "check_in"
    t.datetime "check_out"
    t.index ["sitter_id"], name: "index_bookings_on_sitter_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "children", force: :cascade do |t|
    t.string "gender"
    t.integer "age"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_children_on_user_id"
  end

  create_table "childs", force: :cascade do |t|
    t.string "gender"
    t.integer "age"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_childs_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "sitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sitter_id"], name: "index_favorites_on_sitter_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "USD", null: false
    t.jsonb "payment"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sitter_id"
    t.bigint "booking_id"
    t.index ["booking_id"], name: "index_orders_on_booking_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "reviewsparents", force: :cascade do |t|
    t.text "description"
    t.float "rating"
    t.bigint "user_id"
    t.bigint "sitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "booking_id"
    t.index ["booking_id"], name: "index_reviewsparents_on_booking_id"
    t.index ["sitter_id"], name: "index_reviewsparents_on_sitter_id"
    t.index ["user_id"], name: "index_reviewsparents_on_user_id"
  end

  create_table "reviewssitters", force: :cascade do |t|
    t.text "description"
    t.float "rating"
    t.bigint "user_id"
    t.bigint "sitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "booking_id"
    t.index ["booking_id"], name: "index_reviewssitters_on_booking_id"
    t.index ["sitter_id"], name: "index_reviewssitters_on_sitter_id"
    t.index ["user_id"], name: "index_reviewssitters_on_user_id"
  end

  create_table "sitters", force: :cascade do |t|
    t.integer "price"
    t.text "about"
    t.string "skills"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["user_id"], name: "index_sitters_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.date "birthday"
    t.string "name"
    t.string "address"
    t.string "gender"
    t.float "latitude"
    t.float "longitude"
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "token"
    t.datetime "token_expiry"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "availables", "sitters"
  add_foreign_key "bank_infos", "sitters"
  add_foreign_key "bookings", "sitters"
  add_foreign_key "bookings", "users"
  add_foreign_key "children", "users"
  add_foreign_key "childs", "users"
  add_foreign_key "favorites", "sitters"
  add_foreign_key "favorites", "users"
  add_foreign_key "orders", "bookings"
  add_foreign_key "orders", "users"
  add_foreign_key "reviewsparents", "bookings"
  add_foreign_key "reviewsparents", "sitters"
  add_foreign_key "reviewsparents", "users"
  add_foreign_key "reviewssitters", "bookings"
  add_foreign_key "reviewssitters", "sitters"
  add_foreign_key "reviewssitters", "users"
  add_foreign_key "sitters", "users"
end
