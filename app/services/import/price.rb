# frozen_string_literal: true

module Import
  class Price
    def call
      [
        [82, 86],
        [83, 163],
        [84, 121],
        [85, 73],
        [86, 54],
        [87, 156],
        [88, 92],
        [89, 132],
        [90, 158],
        [91, 132],
        [92, 55],
        [93, 167],
        [94, 45],
        [95, 138],
        [96, 145],
        [97, 128],
        [98, 96],
        [99, 119],
        [100, 153],
        [101, 91],
        [102, 69]
      ].each do |dish_id, price|
        ::Dish.find(dish_id).update(price: price)
      end
    end
  end
end
