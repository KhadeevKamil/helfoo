class DishSerializer < ActiveModel::Serializer
  attributes :id, :title, :image_url, :calories, :carbohydrates, :protein, :fat

  has_many :nutritional_value
  has_many :ingredient
end