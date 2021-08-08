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

ActiveRecord::Schema.define(version: 2021_08_07_073119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartments", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "apartment_number"
    t.decimal "apartment_area"
    t.decimal "heating_counter"
    t.decimal "water_counter"
    t.decimal "electricity_counter"
    t.decimal "arrears"
    t.text "created_at", null: false
    t.text "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin"
    t.string "remember_digest"
  end

  create_table "articles", id: :bigint, default: nil, force: :cascade do |t|
    t.text "title"
    t.text "body"
    t.text "created_at", null: false
    t.text "updated_at", null: false
    t.text "status"
  end

  create_table "comments", id: :bigint, default: nil, force: :cascade do |t|
    t.text "commenter"
    t.text "body"
    t.bigint "article_id", null: false
    t.text "created_at", null: false
    t.text "updated_at", null: false
    t.text "status"
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "electricity_counters", force: :cascade do |t|
    t.decimal "value"
    t.bigint "apartment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["apartment_id"], name: "index_electricity_counters_on_apartment_id"
  end

  create_table "residents", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "apartment_number"
    t.text "lastname"
    t.text "name"
    t.text "surname"
    t.text "phone"
    t.date "birthday"
    t.boolean "owner"
    t.boolean "tenant"
    t.bigint "apartment_id", null: false
    t.text "created_at", null: false
    t.text "updated_at", null: false
    t.index ["apartment_id"], name: "index_residents_on_apartment_id"
  end

  create_table "water_counters", force: :cascade do |t|
    t.decimal "value"
    t.bigint "apartment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["apartment_id"], name: "index_water_counters_on_apartment_id"
  end

  add_foreign_key "comments", "articles", name: "comments_article_id_fkey"
  add_foreign_key "electricity_counters", "apartments"
  add_foreign_key "residents", "apartments", name: "residents_apartment_id_fkey"
  add_foreign_key "water_counters", "apartments"
end
