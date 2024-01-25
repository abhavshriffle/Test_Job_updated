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

ActiveRecord::Schema[7.0].define(version: 2024_01_18_101824) do
  create_table "bids", force: :cascade do |t|
    t.integer "train_operator_id", null: false
    t.integer "parcel_id", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parcel_id"], name: "index_bids_on_parcel_id"
    t.index ["train_operator_id"], name: "index_bids_on_train_operator_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "train_id", null: false
    t.boolean "is_withdraw"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parcel_id"
    t.integer "parcel_owner_id"
    t.string "line_name"
    t.index ["train_id"], name: "index_bookings_on_train_id"
  end

  create_table "lines", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "status"
  end

  create_table "offers", force: :cascade do |t|
    t.integer "train_operator_id", null: false
    t.integer "price"
    t.integer "line_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_offers_on_line_id"
    t.index ["train_operator_id"], name: "index_offers_on_train_operator_id"
  end

  create_table "parcel_owners", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "parcels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weight"
    t.integer "volume"
    t.integer "parcel_owner_id"
  end

  create_table "train_operators", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "trains", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "train_operator_id", null: false
    t.integer "line_id", null: false
    t.integer "capacity"
    t.integer "cost"
    t.boolean "status"
    t.string "line_name"
    t.string "time"
    t.decimal "base_cost_per_unit_distance"
    t.decimal "additional_cost_factor"
    t.integer "distance"
    t.integer "weight"
    t.integer "volume"
    t.index ["line_id"], name: "index_trains_on_line_id"
    t.index ["train_operator_id"], name: "index_trains_on_train_operator_id"
  end

  add_foreign_key "bids", "parcels"
  add_foreign_key "bids", "train_operators"
  add_foreign_key "bookings", "trains"
  add_foreign_key "offers", "lines"
  add_foreign_key "offers", "train_operators"
  add_foreign_key "trains", "lines"
  add_foreign_key "trains", "train_operators"
end
