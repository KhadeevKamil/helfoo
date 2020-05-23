# frozen_string_literal: true

class ProductSerializer < ActiveModel::Serializer
  attribute :id, :title, :amount, :image, :price

  def amount
    1
  end
end
