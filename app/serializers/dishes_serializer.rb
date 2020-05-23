# frozen_string_literal: true

class DishesSerializer < ActiveModel::Serializer
  attribute :result

  def result
    result = []
    i = 1
    object.count.times do
      result << {
        day: i,
        dishes: dishes(i).map do |dish|
          {
            id: dish.id,
            title: dish.title,
            category: CategorySerializer.new(category(dish)),
            image_url: dish.image_url,
            price: dish.price
          }
        end
      }
      i += 1
    end
    result
  end

  def dishes(i)
    object[i - 1][:dishes]
  end

  def category(dish)
    Category.find(dish.category_id)
  end
end
