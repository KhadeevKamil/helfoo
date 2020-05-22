# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  title      :string
#  shop_name  :string
#  price      :string
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Product < ApplicationRecord
  has_many :ingredient_product, dependent: :destroy
  has_many :ingredient, through: :ingredient_product
end
