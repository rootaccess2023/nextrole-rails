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

ActiveRecord::Schema[7.1].define(version: 2026_03_27_154358) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "application_events", force: :cascade do |t|
    t.bigint "job_application_id", null: false
    t.bigint "user_id", null: false
    t.string "title"
    t.string "event_type"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean "all_day"
    t.string "location"
    t.string "meeting_url"
    t.text "notes"
    t.string "status"
    t.integer "reminder_minutes_before"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "salary_min"
    t.integer "salary_max"
    t.string "salary_currency"
    t.string "salary_period"
    t.integer "bonus"
    t.string "equity"
    t.datetime "offer_expires_at"
    t.string "offer_status", default: "pending"
    t.string "employment_type"
    t.index ["job_application_id"], name: "index_application_events_on_job_application_id"
    t.index ["user_id"], name: "index_application_events_on_user_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "company"
    t.string "job_title"
    t.string "job_url"
    t.string "location"
    t.string "source"
    t.string "stage"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
    t.string "employment_type"
    t.text "job_description"
    t.string "contact_name"
    t.string "contact_email"
    t.string "contact_linkedin_url"
    t.datetime "last_contacted_at"
    t.datetime "application_deadline"
    t.datetime "archived_at"
    t.string "closed_reason"
    t.index ["slug"], name: "index_job_applications_on_slug", unique: true
    t.index ["user_id"], name: "index_job_applications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weekly_goal", default: 3
    t.datetime "last_active_at"
    t.datetime "onboarding_completed_at"
    t.string "first_name"
    t.string "last_name"
    t.string "target_role"
    t.string "target_location"
    t.string "employment_type"
    t.integer "follow_up_days", default: 7
    t.string "phone"
    t.string "linkedin_url"
    t.string "portfolio_url"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "application_events", "job_applications"
  add_foreign_key "application_events", "users"
  add_foreign_key "job_applications", "users"
end
