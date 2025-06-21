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

ActiveRecord::Schema[8.0].define(version: 2025_06_21_230437) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "authors", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "password_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "posts_id", null: false
    t.bigint "authors_id", null: false
    t.bigint "parent_comment_id"
    t.text "content"
    t.integer "likes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authors_id"], name: "index_comments_on_authors_id"
    t.index ["parent_comment_id"], name: "index_comments_on_parent_comment_id"
    t.index ["posts_id"], name: "index_comments_on_posts_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.integer "likes"
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_posts_on_author_id"
  end

  add_foreign_key "comments", "authors", column: "authors_id"
  add_foreign_key "comments", "comments", column: "parent_comment_id"
  add_foreign_key "comments", "posts", column: "posts_id"
  add_foreign_key "posts", "authors"
end
