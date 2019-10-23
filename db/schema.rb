# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_23_110725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "all_spaces", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "request_id", null: false
    t.string "name"
    t.string "description"
    t.integer "ppnd"
    t.datetime "created_at"
    t.index ["request_id"], name: "index_all_spaces_on_request_id"
    t.index ["user_id"], name: "index_all_spaces_on_user_id"
  end

  create_table "new_space", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "request_id", null: false
    t.string "name"
    t.string "description"
    t.integer "ppnd"
    t.datetime "created_at"
    t.index ["request_id"], name: "index_new_space_on_request_id"
    t.index ["user_id"], name: "index_new_space_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "space_id"
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.datetime "created_at"
    t.index ["space_id"], name: "index_requests_on_space_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "spaces", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "ppnd"
    t.datetime "created_at"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_spaces_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.datetime "created_at"
  end

end
