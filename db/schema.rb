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

ActiveRecord::Schema.define(version: 20160830230727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cycles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "program_id"
    t.integer  "number"
    t.index ["program_id"], name: "index_cycles_on_program_id", using: :btree
  end

  create_table "exercise_sets", force: :cascade do |t|
    t.integer  "weight"
    t.integer  "reps"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "exercise_id"
    t.index ["exercise_id"], name: "index_exercise_sets_on_exercise_id", using: :btree
  end

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "workout_id"
    t.integer  "one_rm_max"
    t.integer  "cycle_week"
    t.index ["workout_id"], name: "index_exercises_on_workout_id", using: :btree
  end

  create_table "exercises_workouts", id: false, force: :cascade do |t|
    t.integer "exercise_id"
    t.integer "workout_id"
    t.index ["exercise_id"], name: "index_exercises_workouts_on_exercise_id", using: :btree
    t.index ["workout_id"], name: "index_exercises_workouts_on_workout_id", using: :btree
  end

  create_table "programs", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.float    "one_rm_squat"
    t.float    "one_rm_bench_press"
    t.float    "one_rm_deadlift"
    t.float    "one_rm_overhead_press"
    t.string   "person_name"
    t.date     "start_date"
  end

  create_table "workouts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cycle_id"
    t.integer  "program_id"
    t.integer  "cycle_week"
    t.index ["cycle_id"], name: "index_workouts_on_cycle_id", using: :btree
    t.index ["program_id"], name: "index_workouts_on_program_id", using: :btree
  end

  add_foreign_key "cycles", "programs"
  add_foreign_key "exercise_sets", "exercises"
  add_foreign_key "exercises", "workouts"
  add_foreign_key "workouts", "cycles"
  add_foreign_key "workouts", "programs"
end
