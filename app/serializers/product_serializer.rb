# frozen_string_literal: true

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :amount, :image, :price

  def amount
    1
  end

  def image
    object.image_url
  end
end
