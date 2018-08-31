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

ActiveRecord::Schema.define(version: 20180830022359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "visits_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "cover_file_name"
    t.string "cover_content_type"
    t.bigint "cover_file_size"
    t.datetime "cover_updated_at"
    t.string "state", default: "in_draft"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "nombre_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_as", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "article_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "has_category_as", force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "category_a_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_has_category_as_on_article_id"
    t.index ["category_a_id"], name: "index_has_category_as_on_category_a_id"
  end

  create_table "spectators", force: :cascade do |t|
    t.string "nombre_spectator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "status_activities", force: :cascade do |t|
    t.string "nombre_status_activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["university_id"], name: "index_students_on_university_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "nombre_tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "university_id"
    t.bigint "user_id"
    t.index ["university_id"], name: "index_teachers_on_university_id"
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "type_activities", force: :cascade do |t|
    t.string "nombre_type_activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universities", force: :cascade do |t|
    t.string "nombre_university"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_types", force: :cascade do |t|
    t.string "nombre_user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "permission_level", default: 1
    t.bigint "user_type_id"
    t.string "cover_file_name"
    t.string "cover_content_type"
    t.bigint "cover_file_size"
    t.datetime "cover_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

  add_foreign_key "articles", "users"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "has_category_as", "articles"
  add_foreign_key "has_category_as", "category_as"
  add_foreign_key "students", "universities"
  add_foreign_key "students", "users"
  add_foreign_key "teachers", "universities"
  add_foreign_key "teachers", "users"
  add_foreign_key "users", "user_types"
end
