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

ActiveRecord::Schema.define(version: 2020_06_03_064104) do

  create_table "comments", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "feature_id"
    t.string "name"
    t.integer "user_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "project_id"
    t.string "picture"
    t.string "panels"
    t.integer "user_id"
    t.string "feature_work_status"
    t.string "identity_token"
    t.string "status"
    t.string "mailId"
    t.string "username"
    t.index ["identity_token"], name: "index_features_on_identity_token", unique: true
  end

  create_table "finds", force: :cascade do |t|
    t.string "keyword"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "taskname"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "feature_id"
    t.boolean "done"
  end

  create_table "projects", force: :cascade do |t|
    t.string "projectname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "remember_digest"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "image"
    t.string "firstname"
    t.string "lastname"
    t.string "gender"
    t.boolean "activated"
    t.datetime "activated_at"
    t.string "password_reset_token"
    t.string "activation_digest"
  end

end
