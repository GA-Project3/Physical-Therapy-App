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

ActiveRecord::Schema.define(version: 20160627235622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "location"
    t.string   "phone"
    t.string   "description"
    t.string   "image_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "exercises", force: :cascade do |t|
    t.string   "title"
    t.string   "body_part"
    t.string   "description"
    t.string   "image_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "patient_exercises", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "exercise_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "patient_exercises", ["exercise_id"], name: "index_patient_exercises_on_exercise_id", using: :btree
  add_index "patient_exercises", ["patient_id"], name: "index_patient_exercises_on_patient_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "image_url"
    t.string   "phone"
    t.string   "location"
    t.string   "diagnosis"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "doctor_id"
  end

  add_index "patients", ["doctor_id"], name: "index_patients_on_doctor_id", using: :btree

  add_foreign_key "patient_exercises", "exercises"
  add_foreign_key "patient_exercises", "patients"
  add_foreign_key "patients", "doctors"
end
