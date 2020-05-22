# frozen_string_literal: true

require 'csv'

module Import
  class Dish
    # TODO: test
    def call(file_name)
      puts 'Start import Dish'
      i = 0
      CSV.foreach(Rails.root.join("csvs/#{file_name}.csv"), col_sep: ',', headers: true) do |row|
        i+=1
        # next if i > 30

        category_slug = row['type']
        category = ::Category.find_by(slug: category_slug)

        if category.nil?
          puts "Error by creating '#{row['title']}' => category '#{category_slug}' is not exist"
          next
        end

        existed_dish = ::Dish.find_by(title: row['title']) # find_or_initialize_by
        if existed_dish.present?
          puts "Dish '#{row['title']}'/#{existed_dish.id} already exists"
          next
        end

        dish = ::Dish.new(
          title: row['title'],
          slug: Helper.to_slug(row['title']),
          category_id: category.id,
          image_url: row['IMG'],
          calories: row['Calls'],
          carbohydrates: row['Carbs'],
          protein: row['Proteins'],
          fat: row['Fats'],
          price: 0
        )

        # relations

        diets = []
        diet_names = row['diet'].split(',').map(&:strip)
        diet_names.each do |diet_name|
          existed_goal = ::Goal.where("lower(title) = lower('#{diet_name}')").first
          next if existed_goal.nil?
          diets << existed_goal
        end

        if diet_names.size != diets.size
          puts "Error by creating '#{row['title']}' => diets are not match"
          puts "#{diet_names}(#{diet_names.size}) <=> #{diets.map(&:title)}(#{diets.size})"
          next
        end

        dish_inrgedients = []
        [
          ['Item 1', 'Item 1 amount'],
          ['Item 2', 'Item 2 amount'],
          ['Item 3', 'Item 3 amount'],
          ['Item 4', 'Item 4 amount'],
          ['Item 5', 'Item 5 amount'],
          ['Item 6', 'Item 6 amount'],
          ['Item 7', 'Item 7 amount'],
          ['Item 8', 'Item 8 amount']
        ].each do |ingredient_name, ingredient_amount|
          next if row[ingredient_name].nil? || row[ingredient_name].size == 0

          item = ::Ingredient.find_by(title: row[ingredient_name])
          next if item.nil?
          dish_inrgedients << ::DishInrgedient.new(
            ingredient_id: item.id, amount: row[ingredient_amount]
          )
        end

        begin
          ::ActiveRecord::Base.transaction do
            dish.save!
            dish_inrgedients.each do |relation|
              relation.dish_id = dish.id
              relation.save!
            end
            diets.each do |goal|
              ::GoalsDish.create!(dish_id: dish.id, goal_id: goal.id)
            end
          end
          puts "Succes for #{row['title']}"
        rescue StandardError => e
          puts "Error by creating '#{row['title']}' => (Rollback) #{e.inspect}"
          puts e.backtrace.take(20)
        end
      end
    end
  end
end
