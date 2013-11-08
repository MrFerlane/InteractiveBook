# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131108140526) do

  create_table "abilities", force: true do |t|
    t.integer  "character_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acts", force: true do |t|
    t.integer  "page_id"
    t.string   "description"
    t.integer  "success_page"
    t.integer  "fail_page"
    t.integer  "time_fail_page"
    t.integer  "required_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attributes", force: true do |t|
    t.integer  "character_id"
    t.string   "name"
    t.string   "description"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "changes", force: true do |t|
    t.integer  "act_id"
    t.string   "source_class"
    t.string   "source_name"
    t.string   "change_class"
    t.string   "change_way"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters", force: true do |t|
    t.integer  "book_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conditions", force: true do |t|
    t.integer  "act_id"
    t.string   "source_class"
    t.string   "source_name"
    t.string   "condition_class"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "character_id"
    t.string   "name"
    t.string   "description"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.integer  "book_id"
    t.integer  "number"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_controls", force: true do |t|
    t.integer  "book_id"
    t.integer  "started_time"
    t.integer  "end_time"
    t.boolean  "is_time_included"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "is_admin"
    t.boolean  "is_writer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_books_relations", id: false, force: true do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
  end

  add_index "users_books_relations", ["book_id"], name: "index_users_books_relations_on_book_id", using: :btree
  add_index "users_books_relations", ["user_id"], name: "index_users_books_relations_on_user_id", using: :btree

end
