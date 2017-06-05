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

ActiveRecord::Schema.define(version: 20170605213954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliate_products", id: :bigserial, force: :cascade do |t|
    t.string   "affiliate_product_title"
    t.string   "affiliate_product_description"
    t.float    "price"
    t.float    "discount"
    t.integer  "product_id"
    t.integer  "affiliate_id"
    t.float    "weight"
    t.integer  "affiliate_product_id"
    t.string   "affiliate_product_url"
    t.string   "affiliate_product_image_url"
    t.datetime "crawled_at"
    t.boolean  "in_stock"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "affiliates", id: :bigserial, force: :cascade do |t|
    t.string   "title"
    t.string   "type"
    t.string   "reference"
    t.string   "fc_affiliate_key"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "ahoy_events", id: :bigserial, force: :cascade do |t|
    t.integer  "visit_id"
    t.integer  "user_id"
    t.string   "name"
    t.text     "properties"
    t.datetime "time"
  end

  add_index "ahoy_events", ["name", "time"], name: "index_ahoy_events_on_name_and_time", using: :btree
  add_index "ahoy_events", ["user_id", "name"], name: "index_ahoy_events_on_user_id_and_name", using: :btree
  add_index "ahoy_events", ["visit_id", "name"], name: "index_ahoy_events_on_visit_id_and_name", using: :btree

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comfy_cms_blocks", force: :cascade do |t|
    t.string   "identifier",     null: false
    t.text     "content"
    t.integer  "blockable_id"
    t.string   "blockable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_blocks", ["blockable_id", "blockable_type"], name: "index_comfy_cms_blocks_on_blockable_id_and_blockable_type", using: :btree
  add_index "comfy_cms_blocks", ["identifier"], name: "index_comfy_cms_blocks_on_identifier", using: :btree

  create_table "comfy_cms_categories", force: :cascade do |t|
    t.integer "site_id",          null: false
    t.string  "label",            null: false
    t.string  "categorized_type", null: false
  end

  add_index "comfy_cms_categories", ["site_id", "categorized_type", "label"], name: "index_cms_categories_on_site_id_and_cat_type_and_label", unique: true, using: :btree

  create_table "comfy_cms_categorizations", force: :cascade do |t|
    t.integer "category_id",      null: false
    t.string  "categorized_type", null: false
    t.integer "categorized_id",   null: false
  end

  add_index "comfy_cms_categorizations", ["category_id", "categorized_type", "categorized_id"], name: "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", unique: true, using: :btree

  create_table "comfy_cms_files", force: :cascade do |t|
    t.integer  "site_id",                                    null: false
    t.integer  "block_id"
    t.string   "label",                                      null: false
    t.string   "file_file_name",                             null: false
    t.string   "file_content_type",                          null: false
    t.integer  "file_file_size",                             null: false
    t.string   "description",       limit: 2048
    t.integer  "position",                       default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_files", ["site_id", "block_id"], name: "index_comfy_cms_files_on_site_id_and_block_id", using: :btree
  add_index "comfy_cms_files", ["site_id", "file_file_name"], name: "index_comfy_cms_files_on_site_id_and_file_file_name", using: :btree
  add_index "comfy_cms_files", ["site_id", "label"], name: "index_comfy_cms_files_on_site_id_and_label", using: :btree
  add_index "comfy_cms_files", ["site_id", "position"], name: "index_comfy_cms_files_on_site_id_and_position", using: :btree

  create_table "comfy_cms_layouts", force: :cascade do |t|
    t.integer  "site_id",                    null: false
    t.integer  "parent_id"
    t.string   "app_layout"
    t.string   "label",                      null: false
    t.string   "identifier",                 null: false
    t.text     "content"
    t.text     "css"
    t.text     "js"
    t.integer  "position",   default: 0,     null: false
    t.boolean  "is_shared",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_layouts", ["parent_id", "position"], name: "index_comfy_cms_layouts_on_parent_id_and_position", using: :btree
  add_index "comfy_cms_layouts", ["site_id", "identifier"], name: "index_comfy_cms_layouts_on_site_id_and_identifier", unique: true, using: :btree

  create_table "comfy_cms_pages", force: :cascade do |t|
    t.integer  "site_id",                        null: false
    t.integer  "layout_id"
    t.integer  "parent_id"
    t.integer  "target_page_id"
    t.string   "label",                          null: false
    t.string   "slug"
    t.string   "full_path",                      null: false
    t.text     "content_cache"
    t.integer  "position",       default: 0,     null: false
    t.integer  "children_count", default: 0,     null: false
    t.boolean  "is_published",   default: true,  null: false
    t.boolean  "is_shared",      default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_pages", ["parent_id", "position"], name: "index_comfy_cms_pages_on_parent_id_and_position", using: :btree
  add_index "comfy_cms_pages", ["site_id", "full_path"], name: "index_comfy_cms_pages_on_site_id_and_full_path", using: :btree

  create_table "comfy_cms_revisions", force: :cascade do |t|
    t.string   "record_type", null: false
    t.integer  "record_id",   null: false
    t.text     "data"
    t.datetime "created_at"
  end

  add_index "comfy_cms_revisions", ["record_type", "record_id", "created_at"], name: "index_cms_revisions_on_rtype_and_rid_and_created_at", using: :btree

  create_table "comfy_cms_sites", force: :cascade do |t|
    t.string  "label",                       null: false
    t.string  "identifier",                  null: false
    t.string  "hostname",                    null: false
    t.string  "path"
    t.string  "locale",      default: "en",  null: false
    t.boolean "is_mirrored", default: false, null: false
  end

  add_index "comfy_cms_sites", ["hostname"], name: "index_comfy_cms_sites_on_hostname", using: :btree
  add_index "comfy_cms_sites", ["is_mirrored"], name: "index_comfy_cms_sites_on_is_mirrored", using: :btree

  create_table "comfy_cms_snippets", force: :cascade do |t|
    t.integer  "site_id",                    null: false
    t.string   "label",                      null: false
    t.string   "identifier",                 null: false
    t.text     "content"
    t.integer  "position",   default: 0,     null: false
    t.boolean  "is_shared",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_snippets", ["site_id", "identifier"], name: "index_comfy_cms_snippets_on_site_id_and_identifier", unique: true, using: :btree
  add_index "comfy_cms_snippets", ["site_id", "position"], name: "index_comfy_cms_snippets_on_site_id_and_position", using: :btree

  create_table "fae_changes", force: :cascade do |t|
    t.integer  "changeable_id"
    t.string   "changeable_type"
    t.integer  "user_id"
    t.string   "change_type"
    t.text     "updated_attributes"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "fae_changes", ["changeable_id"], name: "index_fae_changes_on_changeable_id", using: :btree
  add_index "fae_changes", ["changeable_type"], name: "index_fae_changes_on_changeable_type", using: :btree
  add_index "fae_changes", ["user_id"], name: "index_fae_changes_on_user_id", using: :btree

  create_table "fae_files", force: :cascade do |t|
    t.string   "name"
    t.string   "asset"
    t.integer  "fileable_id"
    t.string   "fileable_type"
    t.integer  "file_size"
    t.integer  "position",      default: 0
    t.string   "attached_as"
    t.boolean  "on_stage",      default: true
    t.boolean  "on_prod",       default: false
    t.boolean  "required",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fae_files", ["attached_as"], name: "index_fae_files_on_attached_as", using: :btree
  add_index "fae_files", ["fileable_type", "fileable_id"], name: "index_fae_files_on_fileable_type_and_fileable_id", using: :btree

  create_table "fae_images", force: :cascade do |t|
    t.string   "name"
    t.string   "asset"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "alt"
    t.string   "caption"
    t.integer  "position",       default: 0
    t.string   "attached_as"
    t.boolean  "on_stage",       default: true
    t.boolean  "on_prod",        default: false
    t.integer  "file_size"
    t.boolean  "required",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fae_images", ["attached_as"], name: "index_fae_images_on_attached_as", using: :btree
  add_index "fae_images", ["imageable_type", "imageable_id"], name: "index_fae_images_on_imageable_type_and_imageable_id", using: :btree

  create_table "fae_options", force: :cascade do |t|
    t.string   "title"
    t.string   "time_zone"
    t.string   "colorway"
    t.string   "stage_url"
    t.string   "live_url"
    t.integer  "singleton_guard"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fae_options", ["singleton_guard"], name: "index_fae_options_on_singleton_guard", unique: true, using: :btree

  create_table "fae_roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fae_static_pages", force: :cascade do |t|
    t.string   "title"
    t.integer  "position",   default: 0
    t.boolean  "on_stage",   default: true
    t.boolean  "on_prod",    default: false
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fae_static_pages", ["slug"], name: "index_fae_static_pages_on_slug", using: :btree

  create_table "fae_text_areas", force: :cascade do |t|
    t.string   "label"
    t.text     "content"
    t.integer  "position",         default: 0
    t.boolean  "on_stage",         default: true
    t.boolean  "on_prod",          default: false
    t.integer  "contentable_id"
    t.string   "contentable_type"
    t.string   "attached_as"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fae_text_areas", ["attached_as"], name: "index_fae_text_areas_on_attached_as", using: :btree
  add_index "fae_text_areas", ["contentable_id"], name: "index_fae_text_areas_on_contentable_id", using: :btree
  add_index "fae_text_areas", ["contentable_type"], name: "index_fae_text_areas_on_contentable_type", using: :btree
  add_index "fae_text_areas", ["on_prod"], name: "index_fae_text_areas_on_on_prod", using: :btree
  add_index "fae_text_areas", ["on_stage"], name: "index_fae_text_areas_on_on_stage", using: :btree
  add_index "fae_text_areas", ["position"], name: "index_fae_text_areas_on_position", using: :btree

  create_table "fae_text_fields", force: :cascade do |t|
    t.integer  "contentable_id"
    t.string   "contentable_type"
    t.string   "attached_as"
    t.string   "label"
    t.string   "content"
    t.integer  "position",         default: 0
    t.boolean  "on_stage",         default: true
    t.boolean  "on_prod",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fae_text_fields", ["attached_as"], name: "index_fae_text_fields_on_attached_as", using: :btree
  add_index "fae_text_fields", ["contentable_type", "contentable_id"], name: "index_fae_text_fields_on_contentable_type_and_contentable_id", using: :btree
  add_index "fae_text_fields", ["on_prod"], name: "index_fae_text_fields_on_on_prod", using: :btree
  add_index "fae_text_fields", ["on_stage"], name: "index_fae_text_fields_on_on_stage", using: :btree
  add_index "fae_text_fields", ["position"], name: "index_fae_text_fields_on_position", using: :btree

  create_table "fae_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role_id"
    t.boolean  "active"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fae_users", ["confirmation_token"], name: "index_fae_users_on_confirmation_token", unique: true, using: :btree
  add_index "fae_users", ["email"], name: "index_fae_users_on_email", unique: true, using: :btree
  add_index "fae_users", ["reset_password_token"], name: "index_fae_users_on_reset_password_token", unique: true, using: :btree
  add_index "fae_users", ["role_id"], name: "index_fae_users_on_role_id", using: :btree
  add_index "fae_users", ["unlock_token"], name: "index_fae_users_on_unlock_token", unique: true, using: :btree

  create_table "images", id: :bigserial, force: :cascade do |t|
    t.string   "title"
    t.string   "imageable_type"
    t.integer  "imageable_id",       limit: 8
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
  end

  add_index "images", ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.string   "page_type"
    t.integer  "parent_id"
    t.boolean  "enabled"
    t.text     "properties"
    t.string   "url"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.text     "abstract"
    t.text     "standfirst"
    t.text     "footnote"
    t.text     "template"
    t.integer  "user_id"
    t.boolean  "published"
    t.boolean  "featured"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", id: :bigserial, force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "taggings", id: :bigserial, force: :cascade do |t|
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.integer  "tag_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tags", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :bigserial, force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "visits", id: :bigserial, force: :cascade do |t|
    t.string   "visit_token"
    t.string   "visitor_token"
    t.string   "ip"
    t.text     "user_agent"
    t.text     "referrer"
    t.text     "landing_page"
    t.integer  "user_id"
    t.string   "referring_domain"
    t.string   "search_keyword"
    t.string   "browser"
    t.string   "os"
    t.string   "device_type"
    t.integer  "screen_height"
    t.integer  "screen_width"
    t.string   "country"
    t.string   "region"
    t.string   "city"
    t.string   "postal_code"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.datetime "started_at"
  end

  add_index "visits", ["user_id"], name: "index_visits_on_user_id", using: :btree
  add_index "visits", ["visit_token"], name: "index_visits_on_visit_token", unique: true, using: :btree

end
