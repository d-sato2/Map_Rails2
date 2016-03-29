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

ActiveRecord::Schema.define(version: 20160326050402) do

  create_table "hcontacts", force: :cascade do |t|
    t.string   "bureau"
    t.string   "cityname"
    t.string   "cityid"
    t.string   "service"
    t.string   "department"
    t.string   "person"
    t.string   "phone"
    t.string   "mailAddress"
    t.text     "memo"
    t.integer  "hvalue_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "mailAddress2"
  end

  add_index "hcontacts", ["hvalue_id", "created_at"], name: "index_hcontacts_on_hvalue_id_and_created_at"
  add_index "hcontacts", ["hvalue_id"], name: "index_hcontacts_on_hvalue_id"

  create_table "hservices", force: :cascade do |t|
    t.string   "keyName"
    t.string   "serviceName"
    t.text     "comment"
    t.integer  "kibanRelation"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "hvalues", force: :cascade do |t|
    t.string   "cityid"
    t.string   "cityname"
    t.string   "bureau"
    t.string   "ttl"
    t.string   "gw"
    t.string   "frs"
    t.string   "ib"
    t.string   "ft"
    t.string   "rs"
    t.string   "ss"
    t.string   "eac"
    t.string   "eps"
    t.string   "bu"
    t.string   "pa"
    t.string   "et"
    t.string   "mail"
    t.string   "vender"
    t.string   "ns"
    t.string   "cms"
    t.string   "ca"
    t.string   "fn"
    t.string   "ps"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "kyougi"
    t.string   "kiban"
    t.string   "el_kyodo"
    t.string   "kokaike"
    t.string   "koumu"
    t.string   "todoku"
    t.text     "memo_kiban"
    t.text     "memo_service"
    t.string   "citynameKana"
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
