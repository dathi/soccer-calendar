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

ActiveRecord::Schema.define(version: 20150925104817) do

  create_table "matches", force: :cascade do |t|
    t.string  "home"
    t.string  "guest"
    t.string  "happen_time"
    t.string  "score"
    t.integer "tournament_id"
  end

  add_index "matches", ["tournament_id"], name: "index_matches_on_tournament_id"

  create_table "teams", force: :cascade do |t|
    t.string  "name"
    t.integer "played_number"
    t.integer "rank"
    t.integer "points"
    t.integer "wins"
    t.integer "draws"
    t.integer "losts"
    t.integer "goals_for"
    t.integer "goals_against"
    t.integer "goals_difference"
  end

  create_table "tournament_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string  "name"
    t.integer "tournament_type_id"
  end

  add_index "tournaments", ["tournament_type_id"], name: "index_tournaments_on_tournament_type_id"

end
