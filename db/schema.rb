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

ActiveRecord::Schema.define(version: 20190831092322) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "prefecture_id"
    t.string   "city"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "first_category_id",  null: false
    t.integer  "second_category_id", null: false
    t.integer  "third_category_id",  null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["first_category_id"], name: "index_categories_on_first_category_id", using: :btree
    t.index ["second_category_id"], name: "index_categories_on_second_category_id", using: :btree
    t.index ["third_category_id"], name: "index_categories_on_third_category_id", using: :btree
  end

  create_table "item_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image_url",  null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_images_on_item_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "item_title",            limit: 65535, null: false
    t.text     "description",           limit: 65535, null: false
    t.integer  "category_id",                         null: false
    t.integer  "size_id"
    t.integer  "brand_id"
    t.integer  "status_id",                           null: false
    t.integer  "delivery_fee_payer_id",               null: false
    t.integer  "delivery_method_id",                  null: false
    t.integer  "prefecture_id",                       null: false
    t.integer  "shipping_day_id",                     null: false
    t.integer  "price",                               null: false
    t.integer  "user_id",                             null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "aasm_state"
    t.index ["brand_id"], name: "index_items_on_brand_id", using: :btree
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["delivery_fee_payer_id"], name: "index_items_on_delivery_fee_payer_id", using: :btree
    t.index ["delivery_method_id"], name: "index_items_on_delivery_method_id", using: :btree
    t.index ["prefecture_id"], name: "index_items_on_prefecture_id", using: :btree
    t.index ["shipping_day_id"], name: "index_items_on_shipping_day_id", using: :btree
    t.index ["size_id"], name: "index_items_on_size_id", using: :btree
    t.index ["status_id"], name: "index_items_on_status_id", using: :btree
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_likes_on_item_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "sizes_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "size_id",     null: false
    t.integer  "category_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_sizes_categories_on_category_id", using: :btree
    t.index ["size_id"], name: "index_sizes_categories_on_size_id", using: :btree
  end

  create_table "user_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",       null: false
    t.string   "family_name",      null: false
    t.string   "kana_first_name",  null: false
    t.string   "kana_family_name", null: false
    t.integer  "birthday",         null: false
    t.string   "postalcode",       null: false
    t.integer  "prefecture_id",    null: false
    t.string   "city",             null: false
    t.string   "address",          null: false
    t.string   "building",         null: false
    t.string   "phone_number",     null: false
    t.integer  "user_id",          null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["prefecture_id"], name: "index_user_details_on_prefecture_id", using: :btree
    t.index ["user_id"], name: "index_user_details_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                            null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_evaluations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "evaluation_id", null: false
    t.integer  "user_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["evaluation_id"], name: "index_users_evaluations_on_evaluation_id", using: :btree
    t.index ["user_id"], name: "index_users_evaluations_on_user_id", using: :btree
  end

  create_table "users_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_users_items_on_item_id", using: :btree
    t.index ["user_id"], name: "index_users_items_on_user_id", using: :btree
  end

  add_foreign_key "item_images", "items"
  add_foreign_key "likes", "items"
  add_foreign_key "likes", "users"
  add_foreign_key "users_evaluations", "users"
  add_foreign_key "users_items", "items"
  add_foreign_key "users_items", "users"
end
