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

ActiveRecord::Schema.define(version: 20131205190142) do

  create_table "changes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contributors", force: true do |t|
    t.string   "name"
    t.integer  "rank",            limit: 255
    t.text     "observations"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "conversation_id"
  end

  create_table "conversations", force: true do |t|
    t.integer  "discussion_id"
    t.integer  "change_id"
    t.integer  "rank"
    t.integer  "ten_seed"
    t.string   "observations"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discussions", force: true do |t|
    t.string   "lead_facilitator"
    t.integer  "duration"
    t.datetime "date_held"
    t.integer  "group_id"
    t.integer  "village_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fruits", force: true do |t|
    t.integer  "conversation_id"
    t.integer  "rank"
    t.integer  "ten_seed"
    t.text     "observations"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "theme_id"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "national_offices", force: true do |t|
    t.string   "name"
    t.integer  "regional_office_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programmes", force: true do |t|
    t.string   "name"
    t.integer  "number"
    t.integer  "national_office_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regional_offices", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "themes", force: true do |t|
    t.string   "name"
    t.integer  "conversation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "threats", force: true do |t|
    t.string   "name"
    t.integer  "rank",            limit: 255
    t.text     "observations"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "conversation_id"
  end

  create_table "villages", force: true do |t|
    t.string   "name"
    t.integer  "programme_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
