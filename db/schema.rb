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

ActiveRecord::Schema.define(version: 20150720210745) do

  create_table "episodes", force: :cascade do |t|
    t.string   "title"
    t.string   "plot"
    t.integer  "season_id"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "libraries", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "plot"
    t.float    "price",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "title"
    t.string   "plot"
    t.float    "price",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_movies", force: :cascade do |t|
    t.integer  "library_id"
    t.integer  "movie_id"
    t.datetime "purchased_at", null: false
    t.datetime "expire_at",    null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "user_movies", ["library_id"], name: "index_user_movies_on_library_id"
  add_index "user_movies", ["movie_id"], name: "index_user_movies_on_movie_id"

  create_table "user_seasons", force: :cascade do |t|
    t.integer  "library_id"
    t.integer  "season_id"
    t.datetime "purchased_at", null: false
    t.datetime "expire_at",    null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "user_seasons", ["library_id"], name: "index_user_seasons_on_library_id"
  add_index "user_seasons", ["season_id"], name: "index_user_seasons_on_season_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
