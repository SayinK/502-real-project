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

ActiveRecord::Schema[8.1].define(version: 2026_02_13_004005) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "administrator_rank", ["officer", "president"]

  create_table "administrators", primary_key: "user_id", id: :uuid, default: nil, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.enum "rank", null: false, enum_type: "administrator_rank"
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_administrators_on_user_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.string "email", null: false
    t.string "full_name"
    t.string "uid"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "announcements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.boolean "members_only"
    t.string "title", limit: 55
    t.datetime "updated_at", null: false
  end

  create_table "event_memberships", id: false, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "event_id", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id", null: false
    t.index ["event_id"], name: "index_event_memberships_on_event_id"
    t.index ["user_id"], name: "index_event_memberships_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "location", limit: 55
    t.boolean "members_only"
    t.string "name", limit: 55
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "active"
    t.string "address", limit: 255
    t.datetime "created_at", null: false
    t.datetime "dues_expire"
    t.string "email", limit: 80
    t.date "graduation_date"
    t.string "name", limit: 55
    t.integer "phone_number"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "administrators", "users"
  add_foreign_key "event_memberships", "events"
  add_foreign_key "event_memberships", "users"
end
