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

ActiveRecord::Schema.define(:version => 20130520000923) do

  create_table "addresses", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "job_categories", :force => true do |t|
    t.string   "name"
    t.integer  "rank",       :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.text     "blurb"
    t.integer  "job_category_id"
    t.text     "detail"
    t.string   "employer"
    t.integer  "rank",            :default => 0
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "jobs", ["job_category_id"], :name => "index_jobs_on_job_category_id"

  create_table "jobs_pictures", :force => true do |t|
    t.integer  "job_id"
    t.integer  "picture_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "jobs_pictures", ["job_id"], :name => "index_jobs_pictures_on_job_id"
  add_index "jobs_pictures", ["picture_id"], :name => "index_jobs_pictures_on_picture_id"

  create_table "packages", :force => true do |t|
    t.string   "version"
    t.string   "file"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "packages_projects", :force => true do |t|
    t.integer  "package_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "packages_projects", ["package_id"], :name => "index_packages_projects_on_package_id"
  add_index "packages_projects", ["project_id"], :name => "index_packages_projects_on_project_id"

  create_table "pictures", :force => true do |t|
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pictures_posts", :force => true do |t|
    t.integer  "post_id"
    t.integer  "picture_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pictures_posts", ["picture_id"], :name => "index_pictures_posts_on_picture_id"
  add_index "pictures_posts", ["post_id"], :name => "index_pictures_posts_on_post_id"

  create_table "pictures_projects", :force => true do |t|
    t.integer  "picture_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pictures_projects", ["picture_id"], :name => "index_pictures_projects_on_picture_id"
  add_index "pictures_projects", ["project_id"], :name => "index_pictures_projects_on_project_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "picture"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_categories", :force => true do |t|
    t.string   "name"
    t.integer  "rank",       :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "blurb"
    t.text     "detail"
    t.string   "team"
    t.integer  "rank",                :default => 0
    t.integer  "project_category_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "projects", ["project_category_id"], :name => "index_projects_on_project_category_id"

  create_table "resume_categories", :force => true do |t|
    t.string   "name"
    t.integer  "rank",       :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "resume_entries", :force => true do |t|
    t.string   "name"
    t.integer  "rank",               :default => 0
    t.integer  "resume_category_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "resume_entries", ["resume_category_id"], :name => "index_resume_entries_on_resume_category_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "role"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
