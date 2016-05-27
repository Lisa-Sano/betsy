# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160525214238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id", null: false
    t.integer  "order_id",   null: false
    t.integer  "quantity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "order_state",     null: false
    t.integer  "user_id"
    t.integer  "total"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "card_name"
    t.integer  "last_four_cc"
    t.integer  "cc_cvv"
    t.integer  "billing_zip"
    t.string   "cc_exp_month"
    t.string   "cc_exp_year"
    t.string   "shipping_method"
    t.float    "shipping_cost"
  end

  create_table "product_categories", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "product_categories", ["category_id"], name: "index_product_categories_on_category_id", using: :btree
  add_index "product_categories", ["product_id"], name: "index_product_categories_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",                        null: false
    t.integer  "price",                       null: false
    t.integer  "user_id"
    t.string   "description"
    t.integer  "stock",                       null: false
    t.string   "photo_url"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "retired",     default: false
    t.float    "weight"
    t.float    "height"
    t.float    "length"
    t.float    "width"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "product_id", null: false
    t.integer  "user_id"
    t.string   "review"
    t.integer  "rating",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "user_name",       null: false
    t.string   "password_digest"
    t.string   "email",           null: false
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.integer  "last_four_cc"
    t.datetime "cc_exp"
    t.integer  "cc_cvv"
    t.integer  "billing_zip"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "card_name"
  end

end
