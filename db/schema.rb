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

ActiveRecord::Schema.define(version: 2020_10_09_034540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "routes", force: :cascade do |t|
    t.integer "year"
    t.string "bus"
    t.string "gas"
    t.string "helper"
    t.string "helper_b"
    t.string "km"
    t.integer "mes"
    t.datetime "start"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "done"
    t.string "lt_done"
    t.index ["user_id"], name: "index_routes_on_user_id"
  end

  create_table "stops", force: :cascade do |t|
    t.datetime "arrived_at"
    t.integer "year"
    t.string "client"
    t.string "comments"
    t.string "contact"
    t.string "email"
    t.datetime "finished_at"
    t.float "lat"
    t.float "lng"
    t.integer "mes"
    t.string "phone"
    t.bigint "route_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "photos", default: [], array: true
    t.text "signature"
    t.string "gas"
    t.boolean "fail"
    t.date "day"
    t.index ["route_id"], name: "index_stops_on_route_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "client"
    t.date "day"
    t.integer "order", default: 0
    t.boolean "done"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "access", default: 0
    t.integer "user_type", default: 0
  end

  add_foreign_key "routes", "users"
  add_foreign_key "stops", "routes"
end
