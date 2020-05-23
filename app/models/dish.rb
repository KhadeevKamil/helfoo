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
  belongs_to :category

  has_many :dish_inrgedient, dependent: :destroy
  has_many :ingredient, through: :dish_inrgedient
  has_many :nutritional_value, dependent: :destroy
  has_many :goals_dishes, dependent: :destroy
  has_many :goals, through: :goals_dishes

  scope :breakfast, -> { where(category_id: Category.find_by(slug: 'Breakfast')) }
  scope :lunch, -> { where(category_id: Category.find_by(slug: 'Lunch')) }
  scope :desert, -> { where(category_id: Category.find_by(slug: 'Desert')) }
  scope :salat, -> { where(category_id: Category.find_by(slug: 'Salad')) }
  scope :drink, -> { where(category_id: Category.find_by(slug: 'Drink')) }
end
