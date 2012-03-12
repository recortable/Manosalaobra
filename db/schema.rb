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

ActiveRecord::Schema.define(:version => 20120310185346) do

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "body",       :limit => 300
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "contents", :force => true do |t|
    t.string   "title",        :limit => 300
    t.string   "slug",         :limit => 300
    t.string   "type",         :limit => 20
    t.text     "body"
    t.string   "content_type", :limit => 16
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "user_id"
    t.string   "author",       :limit => 100
    t.date     "published_at"
    t.string   "title_ca",     :limit => 300
    t.text     "body_ca"
  end

  create_table "groups", :force => true do |t|
    t.string   "name",       :limit => 100
    t.string   "slug",       :limit => 100
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "groups", ["slug"], :name => "index_groups_on_slug"
  add_index "groups", ["user_id"], :name => "index_groups_on_user_id"

  create_table "media_items", :force => true do |t|
    t.string   "title",        :limit => 120
    t.string   "content_type", :limit => 64
    t.text     "embed_code"
    t.string   "file",         :limit => 300
    t.string   "url",          :limit => 200
    t.integer  "width"
    t.integer  "height"
    t.string   "settings",     :limit => 300
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "memberships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "memberships", ["group_id"], :name => "index_memberships_on_group_id"
  add_index "memberships", ["user_id"], :name => "index_memberships_on_user_id"

  create_table "phases", :force => true do |t|
    t.string   "name",        :limit => 100
    t.string   "description", :limit => 300
    t.string   "token",       :limit => 50
    t.integer  "position"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "phases", ["token"], :name => "index_phases_on_token"

  create_table "problems", :force => true do |t|
    t.string   "title",            :limit => 300
    t.string   "slug",             :limit => 300
    t.integer  "user_id"
    t.integer  "phase_id"
    t.integer  "parent_id"
    t.integer  "group_id"
    t.boolean  "published",                       :default => true
    t.text     "body_context"
    t.text     "body_description"
    t.text     "body_solutions"
    t.text     "settings"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "problems", ["parent_id"], :name => "index_problems_on_parent_id"
  add_index "problems", ["phase_id"], :name => "index_problems_on_phase_id"
  add_index "problems", ["slug"], :name => "index_problems_on_slug", :length => {"slug"=>255}
  add_index "problems", ["user_id"], :name => "index_problems_on_user_id"

  create_table "proposed_names", :force => true do |t|
    t.string   "value",       :limit => 50
    t.string   "request_ip",  :limit => 20
    t.integer  "votes_count",               :default => 0
    t.integer  "votes_value",               :default => 0
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "solutions", :force => true do |t|
    t.string   "title",      :limit => 200
    t.string   "slug",       :limit => 200
    t.integer  "user_id"
    t.integer  "phase_id"
    t.integer  "problem_id"
    t.integer  "group_id"
    t.boolean  "published",                 :default => true
    t.text     "body"
    t.text     "settings"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "solutions", ["phase_id"], :name => "index_solutions_on_phase_id"
  add_index "solutions", ["problem_id"], :name => "index_solutions_on_problem_id"
  add_index "solutions", ["slug"], :name => "index_solutions_on_slug"
  add_index "solutions", ["user_id"], :name => "index_solutions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name",            :limit => 50
    t.string   "slug",            :limit => 50
    t.string   "email",           :limit => 60
    t.string   "password_digest", :limit => 300
    t.string   "role",            :limit => 10
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "value"
    t.integer  "proposed_name_id"
    t.string   "request_ip",       :limit => 20
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

end
