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

ActiveRecord::Schema.define(version: 20150317144615) do

  create_table "bookings", force: :cascade do |t|
    t.text     "description"
    t.string   "student_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "timeslot_id"
    t.time     "start_time"
    t.time     "end_time"
  end

  create_table "instructor", force: :cascade do |t|
    t.string   "country_of_origin"
    t.string   "first_language"
    t.string   "subject_to_teach"
    t.string   "education"
    t.integer  "teacher_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "price_cents",       default: 0,     null: false
    t.string   "price_currency",    default: "USD", null: false
    t.text     "about"
  end

  create_table "instructors", force: :cascade do |t|
    t.string   "country_of_origin"
    t.string   "first_language"
    t.string   "subject_to_teach"
    t.string   "education"
    t.integer  "teacher_id"
    t.integer  "price_cents"
    t.string   "price_currency"
    t.text     "about"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "timeslots", force: :cascade do |t|
    t.integer  "instructor_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                        null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city_time_zone"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token"

end
