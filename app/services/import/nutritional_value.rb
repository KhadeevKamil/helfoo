# frozen_string_literal: true

module Import
  class NutritionalValue
    # TODO: test
    def call
      puts 'Start filling NutritionalValue'

      dish_ids = ::NutritionalValue.all.pluck(:dish_id).uniq
      ::Dish.where.not(id: dish_ids).pluck(:dish_id).each do |dish_id|
        samples.shuffle.take(rand(6)).each do |string|
          ::NutritionalValue.create(
            dish_id: dish_id,
            title: string,
            value: rand(50).to_s
          )
        end
      end
    end

    private

    def samples
      [
        'Витамин А', 'Витамин B', 'Витаминг С', 'Витаминг D',
        'Калий, К', 'Натрий, Na', 'Фосфор, P', 'Магний, Mg'
      ]
    end
  end
end
