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

ActiveRecord::Schema.define(version: 20150811222254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checkins", force: true do |t|
    t.integer  "venue_id"
    t.integer  "user_id"
    t.datetime "first_signal_at"
    t.datetime "last_signal_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: true do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.string  "tag"
  end

  create_table "invitations", force: true do |t|
    t.integer "inviter"
    t.integer "invitee"
    t.integer "venue_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.date     "birthdate"
    t.string   "gender"
    t.string   "device_id"
    t.string   "status"
    t.integer  "most_recent_venue_id"
    t.string   "type"
    t.boolean  "disabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
