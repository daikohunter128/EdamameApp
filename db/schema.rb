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

ActiveRecord::Schema.define(version: 20190722044255) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.string "postal_code", null: false
    t.string "prefecture", null: false
    t.string "city", null: false
    t.string "address1", null: false
    t.string "address2", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address1"], name: "index_addresses_on_address1"
    t.index ["city"], name: "index_addresses_on_city"
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
    t.index ["postal_code"], name: "index_addresses_on_postal_code"
    t.index ["prefecture", "city"], name: "index_addresses_on_prefecture_and_city"
  end

  create_table "administrators", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", null: false
    t.string "email_for_index", null: false
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.string "hashed_password"
    t.date "start_date", null: false
    t.date "end_date"
    t.boolean "suspended", default: false, null: false
    t.string "stock", default: "売り切れ", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_for_index"], name: "index_administrators_on_email_for_index", unique: true
    t.index ["family_name_kana", "given_name_kana"], name: "index_administrators_on_family_name_kana_and_given_name_kana"
  end

  create_table "checks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "check_year", default: 2018, null: false
    t.integer "check_month", default: 1, null: false
    t.integer "check_day", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["check_day"], name: "index_checks_on_check_day"
    t.index ["check_month"], name: "index_checks_on_check_month"
    t.index ["check_year"], name: "index_checks_on_check_year"
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", null: false
    t.string "email_for_index", null: false
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.string "nick_name", null: false
    t.string "hashed_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_for_index"], name: "index_customers_on_email_for_index", unique: true
    t.index ["family_name_kana", "given_name_kana"], name: "index_customers_on_family_name_kana_and_given_name_kana"
    t.index ["nick_name"], name: "index_customers_on_nick_name", unique: true
  end

  create_table "histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_id"
    t.string "nick_name"
    t.string "reservation", default: "注文kgを選択", null: false
    t.string "undispatched", default: "未発送", null: false
    t.integer "year"
    t.integer "month"
    t.integer "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation"], name: "index_histories_on_reservation"
  end

  create_table "phones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.string "number", default: "0", null: false
    t.string "number_for_index", null: false
    t.boolean "primary", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_four_digits"
    t.index ["customer_id"], name: "index_phones_on_customer_id"
    t.index ["last_four_digits"], name: "index_phones_on_last_four_digits"
    t.index ["number_for_index"], name: "index_phones_on_number_for_index"
  end

  create_table "remittances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "deposit", default: "未納", null: false
    t.string "deposit_time"
    t.integer "deposit_year"
    t.integer "deposit_month"
    t.string "full_name"
    t.string "nick_name"
    t.string "prefecture"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_remittances_on_customer_id"
    t.index ["deposit"], name: "index_remittances_on_deposit"
    t.index ["deposit_month"], name: "index_remittances_on_deposit_month"
    t.index ["deposit_time"], name: "index_remittances_on_deposit_time"
    t.index ["deposit_year"], name: "index_remittances_on_deposit_year"
    t.index ["full_name"], name: "index_remittances_on_full_name"
    t.index ["nick_name"], name: "index_remittances_on_nick_name"
  end

  add_foreign_key "addresses", "customers"
  add_foreign_key "phones", "customers"
end
