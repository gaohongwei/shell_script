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

ActiveRecord::Schema.define(version: 20140417050236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disease_symptoms", force: true do |t|
    t.integer  "disease_id"
    t.integer  "symptom_id"
    t.integer  "level_id"
    t.integer  "pct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diseases", force: true do |t|
    t.string   "name"
    t.integer  "same_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "part_feels", force: true do |t|
    t.integer  "part_id"
    t.integer  "feel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts", force: true do |t|
    t.string   "name"
    t.integer  "area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_diseases", force: true do |t|
    t.integer  "patient_id"
    t.integer  "disease_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_symptoms", force: true do |t|
    t.integer  "patient_id"
    t.integer  "symptom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: true do |t|
    t.string   "name"
    t.string   "sex"
    t.integer  "year"
    t.string   "jiguang"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "symptoms", force: true do |t|
    t.string   "name"
    t.integer  "part_id"
    t.integer  "feel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
