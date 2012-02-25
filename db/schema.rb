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

ActiveRecord::Schema.define(:version => 20120221121248) do

  create_table "order_transactions", :force => true do |t|
    t.integer  "order_id"
    t.string   "action"
    t.integer  "amount"
    t.string   "response_success"
    t.string   "response_authorization"
    t.string   "response_message"
    t.boolean  "trxn_status"
    t.string   "trxn_number"
    t.string   "trxn_reference"
    t.string   "trxn_option_1"
    t.string   "trxn_option_2"
    t.string   "trxn_option_3"
    t.string   "auth_code"
    t.integer  "return_amount"
    t.string   "trxn_error"
    t.text     "params"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "total_amount"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "card_expires_on"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
