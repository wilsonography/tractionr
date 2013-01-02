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

ActiveRecord::Schema.define(:version => 20120502015215) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "owner_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "attachments", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "attachment"
    t.integer  "created_by"
    t.integer  "account_id"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "email"
    t.string   "avatar_url"
  end

  create_table "budgets", :force => true do |t|
    t.string   "estimate_type"
    t.integer  "amount"
    t.integer  "created_by"
    t.integer  "account_id"
    t.integer  "budgetable_id"
    t.string   "budgetable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "comments", :force => true do |t|
    t.string   "text"
    t.integer  "created_by"
    t.integer  "comment_id"
    t.integer  "account_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "website"
    t.integer  "primary_contact_id"
    t.integer  "created_by"
    t.integer  "account_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "deliverables", :force => true do |t|
    t.datetime "due_date"
    t.string   "title"
    t.string   "description"
    t.integer  "created_by"
    t.integer  "phase_id"
    t.integer  "account_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "is_template"
  end

  create_table "invoices", :force => true do |t|
    t.integer  "created_by"
    t.integer  "account_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "line_items", :force => true do |t|
    t.string   "description"
    t.integer  "amount"
    t.integer  "quantity"
    t.integer  "invoice_id"
    t.integer  "created_by"
    t.integer  "account_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "phases", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "project_id"
    t.integer  "template_id"
    t.integer  "created_by"
    t.integer  "account_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "is_template"
  end

  create_table "phases_deliverables", :force => true do |t|
    t.integer  "phase_id"
    t.integer  "deliverable_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "created_by"
    t.integer  "account_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "active"
    t.integer  "company_id"
    t.integer  "budget"
  end

  create_table "tasks", :force => true do |t|
    t.datetime "due_date"
    t.string   "title"
    t.string   "description"
    t.integer  "created_by"
    t.integer  "account_id"
    t.integer  "taskable_id"
    t.string   "taskable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "priority"
    t.boolean  "completed"
    t.integer  "user_id"
    t.integer  "budget"
  end

  create_table "templates", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "created_by"
    t.integer  "account_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "templates_deliverables", :force => true do |t|
    t.integer  "deliverable_id"
    t.integer  "template_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "templates_phases", :force => true do |t|
    t.integer  "phase_id"
    t.integer  "template_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "email"
    t.string   "role"
    t.integer  "created_by"
    t.integer  "account_id"
    t.integer  "company_id"
    t.string   "phone"
    t.integer  "availability"
  end

end
