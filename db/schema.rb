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


ActiveRecord::Schema.define(version: 2021_12_02_214620) do
ActiveRecord::Schema.define(version: 2021_12_01_234843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "plumbers", force: :cascade do |t|
    t.string "name"
    t.string "license"
    t.boolean "on_call"
    t.integer "years_experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "plumbershop_id"
    t.index ["plumbershop_id"], name: "index_plumbers_on_plumbershop_id"
  end

  create_table "plumbershops", force: :cascade do |t|
    t.string "name"
    t.boolean "service_offered"
    t.integer "fleet_vehicles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "plumbers", "plumbershops"

  create_table "autoshops", force: :cascade do |t|
    t.string "name"
    t.boolean "open"
    t.integer "vehicles_in_shop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "shop_id"
    t.string "name"
    t.boolean "need_repair"
    t.integer "repair_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "autoshop_id"
    t.index ["autoshop_id"], name: "index_vehicles_on_autoshop_id"
  end

  add_foreign_key "vehicles", "autoshops"
end
