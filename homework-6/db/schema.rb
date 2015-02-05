# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150205092224) do

  create_table "amunitions", force: :cascade do |t|
    t.string  "aumnition_type"
    t.string  "title"
    t.string  "description"
    t.integer "gladiator_id"
  end

  add_index "amunitions", ["gladiator_id"], name: "index_amunitions_on_gladiator_id"

  create_table "gladiators", force: :cascade do |t|
    t.string  "name"
    t.integer "age"
    t.string  "gender"
  end

end
