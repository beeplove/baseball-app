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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130905162748) do

  create_table "divisions", :force => true do |t|
    t.string   "name"
    t.integer  "league_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "leagues", :force => true do |t|
    t.string   "name"
    t.integer  "season_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players", :force => true do |t|
    t.integer  "team_id"
    t.string   "surname"
    t.string   "given_name"
    t.string   "position"
    t.integer  "games"
    t.integer  "games_started"
    t.integer  "complete_games"
    t.integer  "shut_outs"
    t.decimal  "era",             :precision => 10, :scale => 0
    t.integer  "at_bats"
    t.integer  "runs"
    t.string   "earned_runs"
    t.string   "innings"
    t.integer  "hits"
    t.string   "hit_batter"
    t.string   "wild_pitches"
    t.string   "balk"
    t.string   "walked_batter"
    t.string   "doubles"
    t.string   "triples"
    t.integer  "home_runs"
    t.integer  "rbi"
    t.integer  "steals"
    t.string   "caught_stealing"
    t.string   "sacrifice_hits"
    t.string   "sacrifice_flies"
    t.integer  "errs"
    t.string   "pb"
    t.string   "walks"
    t.string   "struck_out"
    t.string   "hit_by_pitch"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "seasons", :force => true do |t|
    t.string   "year"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.integer  "division_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
