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

ActiveRecord::Schema.define(version: 20140925070546) do

  create_table "artist", force: true do |t|
    t.string "name",    null: false
    t.string "outline"
  end

  create_table "music", force: true do |t|
    t.integer "artist_id", null: false
    t.string  "title",     null: false
    t.string  "outline"
  end

  add_index "music", ["artist_id"], name: "idx_artist_id", using: :btree
  add_index "music", ["title"], name: "idx_title", using: :btree

  create_table "play_history", force: true do |t|
    t.integer  "music_id"
    t.datetime "created_at"
  end

  add_index "play_history", ["music_id"], name: "idx_music_id", using: :btree

  create_table "playlist", primary_key: "name", force: true do |t|
    t.string "outline"
  end

  create_table "playlist_detail", id: false, force: true do |t|
    t.string  "playlist_name", default: "", null: false
    t.integer "number",        default: 0,  null: false
    t.integer "music_id"
  end

end
