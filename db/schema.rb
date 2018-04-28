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

ActiveRecord::Schema.define(version: 20180426181825) do

  create_table "addresses", force: :cascade do |t|
    t.string "address_line1"
    t.string "address_line2"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "postal_code"
    t.boolean "is_primary", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_logs", force: :cascade do |t|
    t.string "auth_token"
    t.datetime "deleted_at"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "email"
    t.string "mobile1"
    t.string "mobile2"
    t.string "fax"
    t.boolean "is_primary", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "login_details", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "is_active", default: "true"
    t.datetime "deleted_at"
    t.integer "login_role"
    t.integer "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_login_details_on_tenant_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role_name"
    t.string "role_code"
    t.boolean "active_role", default: true
    t.datetime "delete_at"
    t.string "role_key"
    t.integer "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_roles_on_tenant_id"
  end

  create_table "social_networks", force: :cascade do |t|
    t.string "facebook"
    t.string "google_plus"
    t.string "skype"
    t.string "twiter"
    t.string "linked_in"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.string "tenant_name"
    t.string "tenant_code"
    t.string "tenant_location"
    t.boolean "is_active", default: false
    t.datetime "deleted_at"
    t.string "tenant_key"
    t.integer "contact_id"
    t.integer "address_id"
    t.integer "social_network_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_tenants_on_address_id"
    t.index ["contact_id"], name: "index_tenants_on_contact_id"
    t.index ["social_network_id"], name: "index_tenants_on_social_network_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "salutation"
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_active", default: true
    t.datetime "deleted_at"
    t.string "user_name"
    t.string "user_key"
    t.integer "contact_id"
    t.integer "address_id"
    t.integer "social_network_id"
    t.integer "role_id"
    t.integer "login_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["contact_id"], name: "index_users_on_contact_id"
    t.index ["login_detail_id"], name: "index_users_on_login_detail_id"
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["social_network_id"], name: "index_users_on_social_network_id"
  end

end
