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

ActiveRecord::Schema.define(version: 20170430202334) do

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "details", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin"
    t.string   "contact_number"
    t.string   "address"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_details_on_user_id", using: :btree
  end

  create_table "policies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "policy_type"
    t.string   "description"
    t.decimal  "sum_insured",    precision: 10
    t.decimal  "premium_amount", precision: 10
    t.decimal  "commission",     precision: 10
    t.date     "purchase_date"
    t.date     "mature_date"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "poltype_id"
    t.index ["company_id"], name: "index_policies_on_company_id", using: :btree
    t.index ["poltype_id"], name: "index_policies_on_poltype_id", using: :btree
    t.index ["user_id"], name: "index_policies_on_user_id", using: :btree
  end

  create_table "poltypes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "company_id"
    t.integer  "duration"
    t.decimal  "premium_amount", precision: 10
    t.decimal  "sum_insured",    precision: 10
    t.index ["company_id"], name: "index_poltypes_on_company_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "details", "users"
  add_foreign_key "policies", "companies"
  add_foreign_key "policies", "poltypes"
  add_foreign_key "policies", "users"
  add_foreign_key "poltypes", "companies"
end
