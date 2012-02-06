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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120203011313) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "body",       :limit => 300
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "names", :force => true do |t|
    t.string   "proposed_name", :limit => 50
    t.integer  "votes",                       :default => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title",      :limit => 300
    t.text     "body"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",       :limit => 50
    t.string   "mail",       :limit => 60
    t.string   "password",   :limit => 60
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

end
