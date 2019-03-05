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

ActiveRecord::Schema.define(version: 2019_03_05_161741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "code"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "contacts_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contacts_id"], name: "index_contacts_on_contacts_id"
    t.index ["users_id"], name: "index_contacts_on_users_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "code"
    t.string "label"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "nickname"
    t.string "picture"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_profiles_on_users_id"
  end

  create_table "socials", force: :cascade do |t|
    t.string "code"
    t.string "label"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_socials_on_category_id"
  end

  create_table "technicals", force: :cascade do |t|
    t.string "code"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_goals", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_user_goals_on_goal_id"
    t.index ["user_id"], name: "index_user_goals_on_user_id"
  end

  create_table "user_socials", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "social_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["social_id"], name: "index_user_socials_on_social_id"
    t.index ["user_id"], name: "index_user_socials_on_user_id"
  end

  create_table "user_technicals", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "technical_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "metric"
    t.index ["technical_id"], name: "index_user_technicals_on_technical_id"
    t.index ["user_id"], name: "index_user_technicals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contacts", "users", column: "contacts_id"
  add_foreign_key "contacts", "users", column: "users_id"
  add_foreign_key "profiles", "users", column: "users_id"
  add_foreign_key "socials", "categories"
  add_foreign_key "user_goals", "goals"
  add_foreign_key "user_goals", "users"
  add_foreign_key "user_socials", "socials"
  add_foreign_key "user_socials", "users"
  add_foreign_key "user_technicals", "technicals"
  add_foreign_key "user_technicals", "users"
end
