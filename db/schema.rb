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

ActiveRecord::Schema.define(version: 20170126054002) do

  create_table "conversations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "sender_id",    null: false
    t.integer  "recipient_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "custom_chart_data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "birth_place"
    t.string   "birth_time"
    t.float    "birth_latitude",  limit: 24
    t.float    "birth_longitude", limit: 24
    t.boolean  "time_unknown"
    t.integer  "time_interval"
    t.boolean  "dst"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_custom_chart_data_on_user_id", using: :btree
  end

  create_table "favorites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "fav_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.string   "body",                            null: false
    t.boolean  "read",            default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "poi_positions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "vedic_chart_type"
    t.integer  "vedic_chart_id"
    t.string   "western_chart_type"
    t.integer  "western_chart_id"
    t.string   "poi"
    t.float    "coordinates",        limit: 24
    t.integer  "house"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["vedic_chart_type", "vedic_chart_id"], name: "index_poi_positions_on_vedic_chart_type_and_vedic_chart_id", using: :btree
    t.index ["western_chart_type", "western_chart_id"], name: "index_poi_positions_on_western_chart_type_and_western_chart_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                             default: "",     null: false
    t.string   "encrypted_password",                default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.date     "birthday"
    t.string   "username",                                           null: false
    t.string   "location"
    t.float    "latitude",               limit: 24
    t.float    "longitude",              limit: 24
    t.string   "avatar"
    t.string   "birth_place"
    t.string   "birth_time"
    t.float    "birth_latitude",         limit: 24
    t.float    "birth_longitude",        limit: 24
    t.boolean  "time_unknown"
    t.integer  "time_interval"
    t.boolean  "dst"
    t.string   "role",                              default: "user"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vedic_charts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "house"
    t.string   "sign"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_vedic_charts_on_user_id", using: :btree
  end

  create_table "western_charts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "house"
    t.string   "sign"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_western_charts_on_user_id", using: :btree
  end

end
