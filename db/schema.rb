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

ActiveRecord::Schema.define(version: 20170620094929) do

  create_table "hyperloop_connections", force: :cascade do |t|
    t.string "channel"
    t.string "session"
    t.datetime "created_at"
    t.datetime "expires_at"
    t.datetime "refresh_at"
  end

  create_table "hyperloop_queued_messages", force: :cascade do |t|
    t.text "data"
    t.integer "connection_id"
  end

  create_table "probes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.text "happiness_goals"
    t.text "happiness_signals"
    t.text "happiness_metrics"
    t.text "engagement_goals"
    t.text "engagement_signals"
    t.text "engagement_metrics"
    t.text "adoption_goals"
    t.text "adoption_signals"
    t.text "adoption_metrics"
    t.text "retention_goals"
    t.text "retention_signals"
    t.text "retention_metrics"
    t.text "task_goals"
    t.text "task_signals"
    t.text "task_metrics"
    t.index ["id"], name: "index_probes_on_id"
  end

end
