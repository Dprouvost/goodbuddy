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

ActiveRecord::Schema.define(version: 2019_03_05_140721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_contacts_on_users_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "code"
    t.string "label"
    t.bigint "goals_compatibilities_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goals_compatibilities_id"], name: "index_goals_on_goals_compatibilities_id"
  end

  create_table "goals_compatibilities", force: :cascade do |t|
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_goals_compatibilities_on_users_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "nickname"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socials_categories", force: :cascade do |t|
    t.string "code"
    t.string "label"
    t.bigint "socials_choices_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socials_choices_id"], name: "index_socials_categories_on_socials_choices_id"
  end

  create_table "socials_choices", force: :cascade do |t|
    t.string "code"
    t.string "label"
    t.bigint "socials_compatibilities_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socials_compatibilities_id"], name: "index_socials_choices_on_socials_compatibilities_id"
  end

  create_table "socials_compatibilities", force: :cascade do |t|
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_socials_compatibilities_on_users_id"
  end

  create_table "technicals_choices", force: :cascade do |t|
    t.string "code"
    t.string "label"
    t.bigint "technicals_compatibilities_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["technicals_compatibilities_id"], name: "index_technicals_choices_on_technicals_compatibilities_id"
  end

  create_table "technicals_compatibilities", force: :cascade do |t|
    t.integer "metric"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_technicals_compatibilities_on_users_id"
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

  add_foreign_key "contacts", "users", column: "users_id"
  add_foreign_key "goals", "goals_compatibilities", column: "goals_compatibilities_id"
  add_foreign_key "goals_compatibilities", "users", column: "users_id"
  add_foreign_key "socials_categories", "socials_choices", column: "socials_choices_id"
  add_foreign_key "socials_choices", "socials_compatibilities", column: "socials_compatibilities_id"
  add_foreign_key "socials_compatibilities", "users", column: "users_id"
  add_foreign_key "technicals_choices", "technicals_compatibilities", column: "technicals_compatibilities_id"
  add_foreign_key "technicals_compatibilities", "users", column: "users_id"
end
