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

ActiveRecord::Schema.define(version: 2019_12_02_211431) do

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.string "img"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "page_count"
    t.integer "author_id", null: false
    t.string "img"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "goals", force: :cascade do |t|
    t.integer "reader_id", null: false
    t.integer "book_id", null: false
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_goals_on_book_id"
    t.index ["reader_id"], name: "index_goals_on_reader_id"
  end

  create_table "readers", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.integer "age"
    t.integer "fav_author"
    t.integer "fav_book"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "books", "authors"
  add_foreign_key "goals", "books"
  add_foreign_key "goals", "readers"
end
