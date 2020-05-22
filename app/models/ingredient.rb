# frozen_string_literal: true

# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Ingredient < ApplicationRecord
  has_many :dish_inrgedient
  has_many :dish, through: :dish_inrgedient
  has_many :ingredient_product
  has_many :product, through: :ingredient_product
end
