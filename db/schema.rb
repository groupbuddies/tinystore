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

ActiveRecord::Schema.define(version: 20140217111205) do

  create_table "cart_items", force: true do |t|
    t.integer  "cart_id",                                null: false
    t.integer  "product_id",                             null: false
    t.integer  "amount",                 default: 1,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unitary_price_cents",    default: 0,     null: false
    t.string   "unitary_price_currency", default: "USD", null: false
  end

  create_table "carts", force: true do |t|
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checkouts", force: true do |t|
    t.integer  "store_id",     null: false
    t.integer  "cart_id",      null: false
    t.string   "client_name",  null: false
    t.string   "client_email", null: false
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "store_id"
    t.string   "name",                           null: false
    t.integer  "price_cents",    default: 0,     null: false
    t.string   "price_currency", default: "USD", null: false
    t.string   "picture"
    t.string   "description",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "products", ["deleted_at"], name: "index_products_on_deleted_at"

  create_table "stores", force: true do |t|
    t.integer  "user_id"
    t.string   "name",        null: false
    t.string   "slug",        null: false
    t.string   "email",       null: false
    t.string   "logo"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   default: "", null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
