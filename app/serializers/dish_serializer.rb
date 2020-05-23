# frozen_string_literal: true

class DishSerializer < ActiveModel::Serializer
  attributes :id, :title, :image_url, :calories, :carbohydrates, :protein, :fat, :category

  has_many :nutritional_values
  has_many :inrgedients

  def nutritional_values
    object.nutritional_value.select(:id, :title, :value)
  end

  def category
    CategorySerializer.new(object.category)
  end

  def inrgedients
    object.dish_inrgedient.map do |dish_inr|
      inrg = dish_inr.ingredient
      { id: inrg.id, title: inrg.title, value: dish_inr.amount }
    end
  end
end
