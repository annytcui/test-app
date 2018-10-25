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

ActiveRecord::Schema.define(version: 20181025211511) do

  create_table "adjustments", force: :cascade do |t|
    t.integer "user_id"
    t.string "cis_office"
    t.date "filed"
    t.date "noa"
    t.date "rfe"
    t.date "bio_appt"
    t.date "interview"
    t.string "interview_result"
    t.date "card_received"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_adjustments_on_user_id", unique: true
  end

  create_table "kvisas", force: :cascade do |t|
    t.integer "user_id"
    t.string "center"
    t.string "consulate"
    t.date "sent"
    t.date "noa_1"
    t.date "rfe"
    t.date "rfe_reply"
    t.date "noa_2"
    t.date "nvc_received"
    t.date "case_created"
    t.date "nvc_left"
    t.date "consulate_received"
    t.date "p3_received"
    t.date "p3_sent"
    t.date "p4_received"
    t.date "interview"
    t.string "interview_result"
    t.date "visa_received"
    t.date "us_entry"
    t.date "marriage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_kvisas_on_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "picture"
    t.string "remember_digest"
    t.integer "gender_cd"
    t.date "birthday"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
