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

ActiveRecord::Schema[7.0].define(version: 2023_02_08_190115) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "champions", force: :cascade do |t|
    t.string "name"
    t.integer "key"
    t.string "title"
    t.string "title_pt_br"
    t.string "title_es"
    t.text "blurb"
    t.text "blurb_pt_br"
    t.text "blurb_es"
    t.text "lore"
    t.text "lore_pt_br"
    t.text "lore_es"
    t.integer "difficulty"
    t.string "role"
    t.string "secondary_role"
    t.text "enemy_tips"
    t.text "enemy_tips_pt_br"
    t.text "enemy_tips_es"
    t.text "ally_tips"
    t.text "ally_tips_pt_br"
    t.text "ally_tips_es"
    t.string "name_identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "ai_tips"
    t.index ["key"], name: "index_champions_on_key", unique: true
  end

  create_table "recommendations", force: :cascade do |t|
    t.integer "champion_key"
    t.float "win_rate"
    t.float "pick_rate"
    t.integer "feedback_score"
    t.text "feedback_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tier"
    t.string "position"
    t.string "role"
    t.index ["champion_key"], name: "index_recommendations_on_champion_key"
  end

  create_table "statistics", force: :cascade do |t|
    t.integer "tier"
    t.integer "position"
    t.float "win_rate"
    t.float "pick_rate"
    t.float "performance"
    t.string "role"
    t.string "secondary_role"
    t.integer "kill"
    t.integer "death"
    t.integer "assist"
    t.integer "region"
    t.integer "champion_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "champion_id"
    t.index ["champion_id"], name: "index_statistics_on_champion_id"
    t.index ["tier", "position", "region", "champion_id"], name: "index_unique_statistic_for_champion", unique: true
  end

  add_foreign_key "recommendations", "champions", column: "champion_key", primary_key: "key"
  add_foreign_key "statistics", "champions"
end
