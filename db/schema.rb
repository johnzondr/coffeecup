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

ActiveRecord::Schema.define(version: 20150825233355) do

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

  create_table "earned_rewards", force: true do |t|
    t.integer  "user_id"
    t.integer  "offered_reward_id"
    t.boolean  "claimed"
    t.string   "reward_description"
    t.integer  "venue_id"
    t.date     "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friend_requests", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "requesting_user_id"
    t.integer  "requested_user_id"
  end

  create_table "friendships", force: true do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.string  "tag"
  end

  create_table "ibeacons", force: true do |t|
    t.integer  "venue_id"
    t.string   "city"
    t.integer  "uuid"
    t.integer  "major"
    t.integer  "minor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invitations", force: true do |t|
    t.integer  "inviter_id"
    t.integer  "invitee_id"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offered_rewards", force: true do |t|
    t.string   "description"
    t.date     "expires_at"
    t.date     "activated_at"
    t.date     "deactivated_at"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.date     "birthdate"
    t.string   "gender"
    t.string   "device_id"
    t.string   "status"
    t.integer  "last_check_in_id"
    t.string   "type"
    t.boolean  "hidden"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name"
    t.string   "token"
    t.string   "fb_token"
    t.string   "device_os"
    t.integer  "saved_area_id"
    t.float    "version"
    t.string   "device_token"
  end

  create_table "venue_infos", force: true do |t|
    t.integer  "venue_id"
    t.string   "food"
    t.string   "drinks"
    t.string   "event"
    t.string   "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
