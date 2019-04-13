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

ActiveRecord::Schema.define(version: 2019_04_13_212529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "source"
    t.string "description"
    t.string "url"
    t.string "url_to_image"
    t.datetime "published_at"
    t.text "context"
    t.bigint "topic_id"
    t.index ["topic_id"], name: "index_articles_on_topic_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "author"
    t.bigint "user_id"
    t.bigint "post_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorited_articles", force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "user_id"
    t.index ["article_id"], name: "index_favorited_articles_on_article_id"
    t.index ["user_id"], name: "index_favorited_articles_on_user_id"
  end

  create_table "followed_topics", force: :cascade do |t|
    t.bigint "topic_id"
    t.bigint "user_id"
    t.index ["topic_id"], name: "index_followed_topics_on_topic_id"
    t.index ["user_id"], name: "index_followed_topics_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.text "content"
    t.integer "upvotes", default: 0
    t.bigint "topic_id"
    t.bigint "user_id"
    t.index ["topic_id"], name: "index_posts_on_topic_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.integer "moderator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "moderator"
  end

  add_foreign_key "articles", "topics"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "favorited_articles", "articles"
  add_foreign_key "favorited_articles", "users"
  add_foreign_key "followed_topics", "topics"
  add_foreign_key "followed_topics", "users"
  add_foreign_key "posts", "topics"
  add_foreign_key "posts", "users"
  add_foreign_key "topics", "users", column: "moderator_id"
end
