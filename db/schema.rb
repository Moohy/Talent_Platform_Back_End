# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_28_094619) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "catrgories_services", id: false, force: :cascade do |t|
    t.integer "service_id", null: false
    t.integer "category_id", null: false
    t.index "\"category\"", name: "index_catrgories_services_on_category"
    t.index "\"service\"", name: "index_catrgories_services_on_service"
    t.index ["category_id"], name: "index_catrgories_services_on_category_id"
    t.index ["service_id"], name: "index_catrgories_services_on_service_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.text "url"
    t.integer "service_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_galleries_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "price_range"
    t.string "location"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "catrgories_services", "categories"
  add_foreign_key "catrgories_services", "services"
end
