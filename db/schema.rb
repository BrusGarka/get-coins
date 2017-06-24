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

ActiveRecord::Schema.define(version: 20170404223345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arrearages", force: :cascade do |t|
    t.integer  "user_id",                                                     null: false
    t.integer  "receiver_id",                                                 null: false
    t.integer  "payment_type",                                default: 0,     null: false
    t.integer  "category",                                    default: 0,     null: false
    t.string   "title",                                       default: "",    null: false
    t.text     "description",                                                 null: false
    t.decimal  "total_value",        precision: 10, scale: 2, default: "1.0", null: false
    t.integer  "installment_number",                          default: 1,     null: false
    t.boolean  "paid",                                        default: false, null: false
    t.datetime "pay_at",                                                      null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.index ["receiver_id"], name: "index_arrearages_on_receiver_id", using: :btree
    t.index ["user_id"], name: "index_arrearages_on_user_id", using: :btree
  end

  create_table "authentications", force: :cascade do |t|
    t.string   "authable_type"
    t.integer  "authable_id"
    t.string   "client",                 null: false
    t.string   "encrypted_access_token", null: false
    t.text     "metadata"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["authable_type", "authable_id"], name: "index_authentications_on_authable_type_and_authable_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "installments", force: :cascade do |t|
    t.integer  "arrearage_id",                                          null: false
    t.integer  "number",                                default: 1,     null: false
    t.integer  "month",                                                 null: false
    t.integer  "year",                                                  null: false
    t.string   "receipt"
    t.boolean  "paid",                                  default: false, null: false
    t.decimal  "value",        precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "pay_at",                                                null: false
    t.datetime "paid_at"
    t.datetime "deleted_at"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.index ["arrearage_id"], name: "index_installments_on_arrearage_id", using: :btree
  end

  create_table "monthly_incomes", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.integer  "month",                      null: false
    t.decimal  "value",      default: "1.0", null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_monthly_incomes_on_user_id", using: :btree
  end

  create_table "receivers", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.integer  "category",   default: 0, null: false
    t.string   "name"
    t.string   "document"
    t.integer  "bank_code"
    t.integer  "agency"
    t.integer  "agency_dv"
    t.integer  "account"
    t.integer  "account_dv"
    t.datetime "deleted_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["user_id"], name: "index_receivers_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "full_name",              default: "",      null: false
    t.string   "picture"
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "deleted_at"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_foreign_key "arrearages", "receivers"
  add_foreign_key "arrearages", "users"
  add_foreign_key "installments", "arrearages"
end
