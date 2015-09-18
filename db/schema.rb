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

ActiveRecord::Schema.define(version: 20150917202454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cafes", force: true do |t|
    t.string   "username",        limit: 20,  null: false
    t.string   "email",           limit: 50,  null: false
    t.string   "name",            limit: 50,  null: false
    t.string   "address",         limit: 150, null: false
    t.string   "password_digest",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coffee_gifts", force: true do |t|
    t.integer  "giver_id"
    t.integer  "receiver_id"
    t.integer  "menu_item_id"
    t.boolean  "redeemed",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_items", force: true do |t|
    t.integer  "cafe_id"
    t.string   "name",       limit: 30, null: false
    t.float    "price",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",        limit: 20, null: false
    t.string   "email",           limit: 50, null: false
    t.string   "phone",                      null: false
    t.string   "password_digest",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
