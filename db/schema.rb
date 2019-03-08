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

ActiveRecord::Schema.define(version: 2019_03_08_093926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "stamp"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_on_category_id"
  end

  create_table "profile_cats", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_profile_cats_on_category_id"
    t.index ["profile_id"], name: "index_profile_cats_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "nickname"
    t.string "picture"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.text "description"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "technicals", force: :cascade do |t|
    t.bigint "profile_id"
    t.string "language_1"
    t.string "language_2"
    t.string "language_3"
    t.integer "commit_slot"
    t.integer "github_age"
    t.integer "number_of_projects"
    t.integer "total_commits"
    t.integer "followers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_technicals_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "picture_url"
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weightings", force: :cascade do |t|
    t.bigint "profile_id"
    t.float "social"
    t.float "language"
    t.float "style"
    t.float "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_weightings_on_profile_id"
  end

  add_foreign_key "categories", "categories"
  add_foreign_key "profile_cats", "categories"
  add_foreign_key "profile_cats", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "technicals", "profiles"
  add_foreign_key "weightings", "profiles"
end
