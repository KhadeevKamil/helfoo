# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_522_154_805) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'categories', force: :cascade do |t|
    t.string 'title'
    t.string 'slug'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'dish_inrgedients', force: :cascade do |t|
    t.bigint 'dish_id', null: false
    t.bigint 'ingredient_id', null: false
    t.string 'amount'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['dish_id'], name: 'index_dish_inrgedients_on_dish_id'
    t.index ['ingredient_id'], name: 'index_dish_inrgedients_on_ingredient_id'
  end

  create_table 'dishes', force: :cascade do |t|
    t.string 'title'
    t.string 'slug'
    t.string 'image_url'
    t.float 'calories'
    t.float 'carbohydrates'
    t.float 'protein'
    t.bigint 'category_id', null: false
    t.float 'fat'
    t.float 'price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['category_id'], name: 'index_dishes_on_category_id'
  end

  create_table 'goals', force: :cascade do |t|
    t.string 'title'
    t.string 'slug'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'goals_dishes', force: :cascade do |t|
    t.bigint 'dish_id', null: false
    t.bigint 'goal_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['dish_id'], name: 'index_goals_dishes_on_dish_id'
    t.index ['goal_id'], name: 'index_goals_dishes_on_goal_id'
  end

  create_table 'ingredient_products', force: :cascade do |t|
    t.bigint 'ingredient_id', null: false
    t.bigint 'product_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['ingredient_id'], name: 'index_ingredient_products_on_ingredient_id'
    t.index ['product_id'], name: 'index_ingredient_products_on_product_id'
  end

  create_table 'ingredients', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'nutritional_values', force: :cascade do |t|
    t.bigint 'dish_id', null: false
    t.string 'title'
    t.string 'value'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['dish_id'], name: 'index_nutritional_values_on_dish_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'title'
    t.string 'shop_name'
    t.string 'image_url'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.float 'price'
  end

  add_foreign_key 'dish_inrgedients', 'dishes'
  add_foreign_key 'dish_inrgedients', 'ingredients'
  add_foreign_key 'dishes', 'categories'
  add_foreign_key 'goals_dishes', 'dishes'
  add_foreign_key 'goals_dishes', 'goals'
  add_foreign_key 'ingredient_products', 'ingredients'
  add_foreign_key 'ingredient_products', 'products'
  add_foreign_key 'nutritional_values', 'dishes'
end
