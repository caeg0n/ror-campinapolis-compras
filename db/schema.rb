# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_04_18_012626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "device_id"
    t.string "name"
    t.string "cel"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
  end

  create_table "categories", force: :cascade do |t|
    t.integer "organization_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_url"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "phone_number"
    t.boolean "is_deliveryman"
    t.boolean "is_organization"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "orders"
    t.integer "origin_id"
    t.integer "deliveryman_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "device"
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "device_class"
  end

  create_table "orders", force: :cascade do |t|
    t.string "device_id"
    t.integer "product_id"
    t.integer "address"
    t.string "consumer_name"
    t.integer "payment"
    t.decimal "total"
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "salesman_state"
    t.string "reference"
    t.integer "delivery_state"
  end

  create_table "organization_category_tags", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "tag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "organization_devices", force: :cascade do |t|
    t.integer "organization_id"
    t.string "device_id"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "cel"
    t.string "logo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "password"
    t.integer "organization_type"
    t.string "token"
    t.boolean "open"
    t.string "cover"
    t.decimal "delivery_fee"
    t.decimal "max_price_to_fee"
    t.decimal "minimal_buy_price"
    t.string "category_base"
    t.integer "organization_status"
    t.integer "delivery_type"
  end

  create_table "payments", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.integer "payment_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "price"
    t.integer "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "img"
    t.integer "organization_id"
    t.integer "status"
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "rankings", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.integer "hearts"
    t.integer "hearts_votes"
    t.integer "stars"
    t.integer "star_votes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_rankings_on_organization_id"
  end

  add_foreign_key "products", "categories"
  add_foreign_key "rankings", "organizations"
end
