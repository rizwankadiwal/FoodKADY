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

ActiveRecord::Schema.define(version: 20180412191936) do

  create_table "banners", force: :cascade do |t|
    t.string "slideshow_banner_title"
    t.string "slideshow_banner_subtitle"
    t.string "long_banner_title"
    t.string "long_banner_subtitle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "banner_image_file_name"
    t.string "banner_image_content_type"
    t.integer "banner_image_file_size"
    t.datetime "banner_image_updated_at"
    t.string "banner_link"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.string "category_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category_image_file_name"
    t.string "category_image_content_type"
    t.integer "category_image_file_size"
    t.datetime "category_image_updated_at"
    t.integer "parent_id"
  end

  create_table "categories_products", force: :cascade do |t|
    t.integer "category_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_products_on_category_id"
    t.index ["product_id"], name: "index_categories_products_on_product_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_no"
    t.string "int"
    t.string "full_name"
    t.string "string"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.string "sku"
    t.boolean "is_available"
    t.boolean "taxable_class"
    t.text "product_description"
    t.decimal "price"
    t.decimal "cost"
    t.text "notes"
    t.integer "stock_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_image_file_name"
    t.string "product_image_content_type"
    t.integer "product_image_file_size"
    t.datetime "product_image_updated_at"
    t.boolean "hotdeal"
    t.decimal "sale_price"
  end

  create_table "super_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_super_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_super_users_on_reset_password_token", unique: true
  end

end
