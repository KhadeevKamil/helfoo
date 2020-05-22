# frozen_string_literal: true

# == Schema Information
#
# Table name: dishes
#
#  id            :bigint           not null, primary key
#  title         :string
#  slug          :string
#  image_url     :string
#  calories      :float
#  carbohydrates :float
#  protein       :float
#  category_id   :bigint           not null
#  fat           :float
#  price         :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Dish < ApplicationRecord
  has_one :category

  has_many :dish_inrgedient
  has_many :ingredient, through: :dish_inrgedient
  has_many :nutritional_value
  has_many :goals_dishes
  has_many :goals, through: :goals_dishes

  scope :breakfest, -> { where(category_id: Category.find_by(slug: "breakfest")) }
  scope :lunch, -> { where(category_id: Category.find_by(slug: "lunch")) }
  scope :desert, -> { where(category_id: Category.find_by(slug: "desert")) }
  scope :salat, -> { where(category_id: Category.find_by(slug: "salat")) }
  scope :drink, -> { where(category_id: Category.find_by(slug: "drink")) }
end