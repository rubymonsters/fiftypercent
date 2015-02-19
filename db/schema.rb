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

ActiveRecord::Schema.define(version: 20150219104002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.string   "author",           limit: 255
    t.string   "public_contact",   limit: 255
    t.string   "internal_contact", limit: 255
    t.integer  "commentable_id"
    t.string   "commentable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mod_state"
  end

  create_table "events", force: :cascade do |t|
    t.text     "title"
    t.text     "subtitle"
    t.datetime "date"
    t.string   "city",                limit: 255
    t.string   "country_code",        limit: 255
    t.text     "description"
    t.string   "main_url",            limit: 255
    t.text     "contact_url"
    t.string   "speaker_list_url",    limit: 255
    t.integer  "woman"
    t.integer  "total"
    t.string   "category",            limit: 255
    t.string   "reporter",            limit: 255
    t.string   "reporter_url",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "organizers"
    t.text     "internal_user_info"
    t.text     "internal_admin_info"
    t.datetime "published_at"
    t.text     "remark"
    t.string   "mod_state"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id"
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count",             default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",         limit: 255
    t.string   "password_hash", limit: 255
    t.string   "password_salt", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
