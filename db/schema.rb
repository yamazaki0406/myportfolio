# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_190_822_192_105) do
  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.integer 'record_id', null: false
    t.integer 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'children', force: :cascade do |t|
    t.string 'name'
    t.string 'sex'
    t.date 'birthday'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
    t.string 'child_password'
  end

  create_table 'families', force: :cascade do |t|
    t.integer 'child_id'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['child_id'], name: 'index_families_on_child_id'
    t.index ['user_id'], name: 'index_families_on_user_id'
  end

  create_table 'growths', force: :cascade do |t|
    t.date 'date'
    t.float 'height'
    t.float 'weight'
    t.integer 'child_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
    t.index ['child_id'], name: 'index_growths_on_child_id'
  end

  create_table 'microposts', force: :cascade do |t|
    t.text 'content'
    t.integer 'child_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
    t.index %w[child_id created_at], name: 'index_microposts_on_child_id_and_created_at'
    t.index ['child_id'], name: 'index_microposts_on_child_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'password_digest'
    t.string 'remember_digest'
    t.boolean 'admin', default: false
    t.index ['email'], name: 'index_users_on_email', unique: true
  end
end
