
# frozen_string_literal: true

class DishSerializer < ActiveModel::Serializer
  attributes :id, :title, :slug, :category, :image_url, :price

  # def qwe
  #   binding.pry
  # end
end
