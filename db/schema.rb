ActiveRecord::Schema.define(version: 2020_07_10_154722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string "theme"
    t.integer "project_budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contestant_projects", force: :cascade do |t|
    t.bigint "contestant_id"
    t.bigint "project_id"
    t.index ["contestant_id"], name: "index_contestant_projects_on_contestant_id"
    t.index ["project_id"], name: "index_contestant_projects_on_project_id"
  end

  create_table "contestants", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "hometown"
    t.integer "years_of_experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "material"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "challenge_id"
    t.index ["challenge_id"], name: "index_projects_on_challenge_id"
  end

  add_foreign_key "contestant_projects", "contestants"
  add_foreign_key "contestant_projects", "projects"
  add_foreign_key "projects", "challenges"
end
