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

ActiveRecord::Schema.define(version: 20141212024045) do

  create_table "histories", force: true do |t|
    t.integer  "user_id"
    t.string   "last_ip",    default: ""
    t.string   "platform",   default: ""
    t.string   "platform_v", default: ""
    t.string   "model",      default: ""
    t.string   "imei",       default: ""
    t.string   "resolution", default: ""
    t.datetime "created_at"
  end

  create_table "users", force: true do |t|
    t.string   "mobile",                 default: ""
    t.string   "avatar",                 default: ""
    t.string   "name",                   default: ""
    t.string   "remark",                 default: ""
    t.integer  "lng",                    default: 0
    t.integer  "lat",                    default: 0
    t.boolean  "enabled",                default: true
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "last_login"
    t.string   "last_ip",                default: ""
    t.string   "client_v",               default: ""
    t.string   "platform",               default: ""
    t.string   "platform_v",             default: ""
    t.string   "model",                  default: ""
    t.string   "imei",                   default: ""
    t.string   "resolution",             default: ""
    t.string   "network",                default: ""
    t.string   "channel",                default: ""
    t.string   "first_install",          default: ""
    t.string   "last_update",            default: ""
    t.string   "operator",               default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
