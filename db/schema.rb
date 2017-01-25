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

ActiveRecord::Schema.define(version: 20170125185843) do

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id",    limit: 4, null: false
    t.integer  "recipient_id", limit: 4, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "custom_chart_data", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.string   "birth_place",     limit: 255
    t.string   "birth_time",      limit: 255
    t.float    "birth_latitude",  limit: 24
    t.float    "birth_longitude", limit: 24
    t.boolean  "time_unknown"
    t.integer  "time_interval",   limit: 4
    t.boolean  "dst"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "custom_chart_data", ["user_id"], name: "index_custom_chart_data_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "conversation_id", limit: 4
    t.integer  "user_id",         limit: 4
    t.string   "body",            limit: 255,                 null: false
    t.boolean  "read",                        default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "poi_positions", force: :cascade do |t|
    t.integer  "vedic_chart_id",     limit: 4
    t.string   "vedic_chart_type",   limit: 255
    t.integer  "western_chart_id",   limit: 4
    t.string   "western_chart_type", limit: 255
    t.string   "poi",                limit: 255
    t.float    "coordinates",        limit: 24
    t.integer  "house",              limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "poi_positions", ["vedic_chart_type", "vedic_chart_id"], name: "index_poi_positions_on_vedic_chart_type_and_vedic_chart_id", using: :btree
  add_index "poi_positions", ["western_chart_type", "western_chart_id"], name: "index_poi_positions_on_western_chart_type_and_western_chart_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",     null: false
    t.string   "encrypted_password",     limit: 255, default: "",     null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.date     "birthday"
    t.string   "username",               limit: 255,                  null: false
    t.string   "location",               limit: 255
    t.float    "latitude",               limit: 24
    t.float    "longitude",              limit: 24
    t.string   "avatar",                 limit: 255
    t.string   "birth_place",            limit: 255
    t.float    "birth_latitude",         limit: 24
    t.float    "birth_longitude",        limit: 24
    t.boolean  "time_unknown"
    t.integer  "time_interval",          limit: 4
    t.boolean  "dst"
    t.string   "role",                   limit: 255, default: "user"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vedic_charts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "house",      limit: 4
    t.string   "sign",       limit: 255
    t.string   "type",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "vedic_charts", ["user_id"], name: "index_vedic_charts_on_user_id", using: :btree

  create_table "western_charts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "house",      limit: 4
    t.string   "sign",       limit: 255
    t.string   "type",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "western_charts", ["user_id"], name: "index_western_charts_on_user_id", using: :btree

  add_foreign_key "custom_chart_data", "users"
  add_foreign_key "vedic_charts", "users"
  add_foreign_key "western_charts", "users"
end
