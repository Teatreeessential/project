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

ActiveRecord::Schema.define(version: 20180712103808) do

  create_table "categories", force: :cascade do |t|
    t.string   "category_contents"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "message_contents"
    t.integer  "receive_user_id"
    t.integer  "send_user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "portfolios", force: :cascade do |t|
    t.string   "portfolio_title"
    t.string   "portfolio_contents"
    t.string   "portfolio_file"
    t.string   "portfolio_start"
    t.string   "portfolio_end"
    t.string   "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "project_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "project_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "comment_contents"
    t.string   "comment_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "project_skills", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "project_title"
    t.string   "project_contents"
    t.string   "project_start"
    t.string   "project_end"
    t.integer  "project_people_no"
    t.integer  "project_view"
    t.integer  "project_complete"
    t.integer  "skill_id"
    t.integer  "category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "skill_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "skill_contents"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "user_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_comments", force: :cascade do |t|
    t.string   "comment_contents"
    t.string   "date"
    t.integer  "reply_user_id"
    t.integer  "profile_user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "user_projects", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "user_access_token"
    t.string   "user_password"
    t.string   "user_image"
    t.string   "user_contents"
    t.string   "git_skill_1"
    t.string   "git_skill_2"
    t.string   "git_skill_3"
    t.string   "category_1"
    t.string   "category_2"
    t.string   "category_3"
    t.string   "birth"
    t.string   "address"
    t.string   "tel"
    t.integer  "user_point"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
