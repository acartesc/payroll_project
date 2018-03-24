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

ActiveRecord::Schema.define(version: 20180324150617) do

  create_table "base_salaries", force: :cascade do |t|
    t.integer "amount"
    t.integer "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["worker_id"], name: "index_base_salaries_on_worker_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "client_rut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "taxpayer_id_company"
    t.string "business_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.index ["client_id"], name: "index_companies_on_client_id"
  end

  create_table "family_burdens", force: :cascade do |t|
    t.string "rut"
    t.string "name"
    t.integer "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["worker_id"], name: "index_family_burdens_on_worker_id"
  end

  create_table "health_plans", force: :cascade do |t|
    t.string "name"
    t.float "deduction"
    t.integer "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["worker_id"], name: "index_health_plans_on_worker_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "rut"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name1"
    t.string "last_name2"
    t.date "birthdate"
    t.string "gender"
    t.string "email"
    t.string "phone"
    t.string "address_region"
    t.string "address_city"
    t.string "address_street"
    t.string "address_number"
    t.string "address_apartment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.index ["company_id"], name: "index_workers_on_company_id"
  end

end
