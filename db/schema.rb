# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_28_063936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.string "field", null: false, array: true
    t.integer "size", null: false
    t.integer "density", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_boards_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.integer "status", default: 1, null: false
    t.jsonb "turns_order", null: false
    t.string "current_turn_index", default: "1", null: false
    t.bigint "winner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_games_on_author_id"
    t.index ["winner_id"], name: "index_games_on_winner_id"
  end

  create_table "plays", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_plays_on_game_id"
    t.index ["player_id"], name: "index_plays_on_player_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "login", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["login"], name: "index_users_on_login", unique: true
  end

  add_foreign_key "boards", "games"
  add_foreign_key "games", "users", column: "author_id"
  add_foreign_key "games", "users", column: "winner_id"
  add_foreign_key "plays", "games"
  add_foreign_key "plays", "users", column: "player_id"
end
