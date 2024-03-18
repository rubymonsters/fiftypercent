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

ActiveRecord::Schema.define(version: 2018_09_18_194314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blog_categories", id: :serial, force: :cascade do |t|
    t.string "slug"
    t.string "name"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blog_categories_pages", id: false, force: :cascade do |t|
    t.integer "blog_category_id", null: false
    t.integer "page_id", null: false
    t.index ["blog_category_id", "page_id"], name: "index_blog_categories_pages_on_blog_category_id_and_page_id"
    t.index ["page_id", "blog_category_id"], name: "index_blog_categories_pages_on_page_id_and_blog_category_id"
  end

  create_table "blog_category_translations", force: :cascade do |t|
    t.integer "blog_category_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["blog_category_id"], name: "index_blog_category_translations_on_blog_category_id"
    t.index ["locale"], name: "index_blog_category_translations_on_locale"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "title"
    t.text "body"
    t.string "author"
    t.string "public_contact"
    t.string "internal_contact"
    t.string "commentable_type"
    t.integer "commentable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "mod_state"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.text "title"
    t.text "subtitle"
    t.datetime "date"
    t.string "city"
    t.string "country_code"
    t.text "description"
    t.string "main_url"
    t.text "contact_url"
    t.string "speaker_list_url"
    t.integer "woman"
    t.integer "total"
    t.string "category"
    t.string "reporter"
    t.string "reporter_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "organizers"
    t.text "internal_user_info"
    t.text "internal_admin_info"
    t.datetime "published_at"
    t.text "remark"
    t.string "mod_state"
    t.text "body"
    t.string "reporter_twitter"
    t.string "reporter_email"
    t.string "contact_twitter"
    t.string "contact_email"
  end

  create_table "images", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "page_translations", force: :cascade do |t|
    t.integer "page_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.text "body"
    t.index ["locale"], name: "index_page_translations_on_locale"
    t.index ["page_id"], name: "index_page_translations_on_page_id"
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.string "slug"
    t.string "title"
    t.text "body"
    t.string "page_type"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "public", default: false
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email"
    t.string "password_hash"
    t.string "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
