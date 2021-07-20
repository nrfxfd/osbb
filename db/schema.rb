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

ActiveRecord::Schema.define(version: 2021_07_14_171959) do

  create_table "apartments", force: :cascade do |t|
    t.integer "apartment_number"
    t.decimal "apartment_area"
    t.decimal "water_is_paid"
    t.decimal "electricity_is_paid"
    t.decimal "current_meters_water"
    t.decimal "current_meter_electricity"
    t.decimal "arrears"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.integer "article_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "residents", force: :cascade do |t|
    t.integer "apartment_number"
    t.text "lastname"
    t.text "name"
    t.text "surname"
    t.text "phone"
    t.date "birthday"
    t.boolean "owner"
    t.boolean "tenant"
    t.integer "apartment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["apartment_id"], name: "index_residents_on_apartment_id"
  end

  add_foreign_key "comments", "articles"
  add_foreign_key "residents", "apartments"
end
