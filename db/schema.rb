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

ActiveRecord::Schema[8.0].define(version: 2025_02_11_211918) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "guilds", force: :cascade do |t|
    t.string "name"
    t.bigint "parent_guild_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_guild_id"], name: "index_guilds_on_parent_guild_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.decimal "modifier", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ledgers", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "item_id", null: false
    t.integer "qty"
    t.bigint "rarity_id", null: false
    t.string "action"
    t.decimal "modifier", precision: 5, scale: 2
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_ledgers_on_item_id"
    t.index ["player_id"], name: "index_ledgers_on_player_id"
    t.index ["rarity_id"], name: "index_ledgers_on_rarity_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.bigint "guild_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guild_id"], name: "index_members_on_guild_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.bigint "guild_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["guild_id"], name: "index_players_on_guild_id"
  end

  create_table "rarities", force: :cascade do |t|
    t.string "name"
    t.decimal "modifier", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", default: "", null: false
    t.string "uid", default: "", null: false
    t.string "name", default: "", null: false
    t.boolean "admin"
    t.boolean "manager"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "guilds", "guilds", column: "parent_guild_id"
  add_foreign_key "ledgers", "items"
  add_foreign_key "ledgers", "players"
  add_foreign_key "ledgers", "rarities"
  add_foreign_key "members", "guilds"
  add_foreign_key "players", "guilds"
end
