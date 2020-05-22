# frozen_string_literal: true

# == Schema Information
#
# Table name: ingredient_products
#
#  id            :bigint           not null, primary key
#  ingredient_id :bigint           not null
#  product_id    :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class IngredientProduct < ApplicationRecord
  belongs_to :ingredient
  belongs_to :product
end
