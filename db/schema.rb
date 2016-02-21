# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160221230354) do

  create_table "hvalues", force: :cascade do |t|
    t.string   "cityid"
    t.string   "N03_004"
    t.string   "bureau"
    t.integer  "ttl"
    t.integer  "gw"
    t.integer  "frs"
    t.integer  "ib"
    t.integer  "ft"
    t.integer  "rs"
    t.integer  "ss"
    t.integer  "eac"
    t.integer  "eps"
    t.integer  "bu"
    t.integer  "pa"
    t.integer  "et"
    t.integer  "mail"
    t.integer  "vender"
    t.integer  "ns"
    t.integer  "cms"
    t.integer  "ca"
    t.integer  "fn"
    t.integer  "ps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "japans", force: :cascade do |t|
    t.string   "city_id"
    t.string   "name_local"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",                         null: false
    t.integer  "item_id",                           null: false
    t.string   "event",                             null: false
    t.string   "whodunnit"
    t.text     "object",         limit: 1073741823
    t.datetime "created_at"
    t.text     "object_changes", limit: 1073741823
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
