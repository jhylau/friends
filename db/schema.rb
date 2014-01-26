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

ActiveRecord::Schema.define(:version => 20140123233010) do

  create_table "airlines", :force => true do |t|
    t.string  "name"
    t.string  "iata"
    t.string  "icao"
    t.string  "call_sign"
    t.string  "twitter_screen_name"
    t.integer "twitter_user_id",     :limit => 8
  end

  create_table "airports", :force => true do |t|
    t.string "icao"
    t.string "iata"
    t.string "name"
    t.string "province"
    t.string "city"
    t.string "classification"
  end

  create_table "flight_searches", :force => true do |t|
    t.date    "flight_start"
    t.date    "flight_end"
    t.integer "duration"
    t.integer "adults"
    t.integer "children"
    t.integer "infants"
  end

  create_table "flights", :force => true do |t|
    t.date    "departure"
    t.date    "arrival"
    t.integer "price"
    t.integer "duration"
    t.string  "airline_id"
  end

  create_table "hotel_searches", :force => true do |t|
    t.integer "hotel_id"
    t.date    "start_date"
    t.date    "end_date"
    t.integer "guests"
  end

  create_table "tweets", :force => true do |t|
    t.string  "text"
    t.integer "tweet_id",        :limit => 8
    t.integer "twitter_user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
