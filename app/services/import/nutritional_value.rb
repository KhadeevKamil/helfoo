# frozen_string_literal: true

module Import
  class NutritionalValue
    def call
      puts 'Start filling NutritionalValue'
      i = 0
      dish_ids = ::NutritionalValue.all.pluck(:dish_id).uniq
      scope = if dish_ids.size > 0
        ::Dish.where.not(id: dish_ids)
      else
        ::Dish.all
      end
      scope.pluck(:id).each do |dish_id|
        i += 1
        # next if i > 3
        puts "Saving data for Dish##{dish_id}"
        samples.shuffle.take(rand(6) + 2).each do |string|
          ::NutritionalValue.create(
            dish_id: dish_id,
            title: string,
            value: (rand(50)+10).to_s
          )
        end
      end
    end

    private

    def samples
      [
        'Витамин А', 'Витамин B', 'Витамин С', 'Витаминг D',
        'Калий, К', 'Натрий, Na', 'Фосфор, P', 'Магний, Mg'
      ]
    end
  end
end
