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

ActiveRecord::Schema.define(version: 20130706211019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: true do |t|
    t.string   "activity_type",      null: false
    t.integer  "fitness_amount"
    t.integer  "dollars_per_person"
    t.integer  "creator_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "challenges", ["creator_id"], name: "index_challenges_on_creator_id", using: :btree

  create_table "participations", force: true do |t|
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.integer  "amount",       default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participations", ["user_id", "challenge_id"], name: "index_participations_on_user_id_and_challenge_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "humanapi_token", null: false
    t.string   "stripe_token"
    t.string   "email",          null: false
    t.string   "name",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["humanapi_token"], name: "index_users_on_humanapi_token", unique: true, using: :btree

end
