# frozen_string_literal: true

module Api
  module V1
    class DishesController < ::Api::V1::ApplicationController
      respond_to :json

      # GET /dishes
      # GET /dishes.json
      def index
        # goal_slug = params[:goal_slug]
        # days = params[:days]

        # goal_id = Goal.find_by(slug: goal_slug).id

        # dishes_ids = GoalsDish.where(goal_id: goal_id).map { |t| t.dish_id }

        # dishes = Dish.where(id: dishes_ids)

        dishes = [{
          day: 1,
          dishes: [
            {
              id: 83,
              title: 'Грушевый салат',
              category: { id: 123, slug: 'breakfast', title: 'Завтрак' },
              image_url: 'public/assets/profile.jpg',
              price: 990
            }
          ]
        }]

        # binding.pry
        # render json: dishes, each_serializer: DishSerializer, status: :ok
        render json: dishes, status: :ok
      end

      # GET /dishes/1
      # GET /dishes/1.json
      def show
        # binding.pry
        # @dish = Dish.find params[:id]

        dish = {
          id: 123,
          title: 'Грушевый салат',
          image_url: 'http://sdfsdf.com/sdfsdf',
          calories: 283,
          carbohydrates: 55,
          protein: 10,
          fat: 2,
          nutritional_values: [
            { id: 123, title: 'Витами А', value: 123}
          ],
          inrgedients: [
            { id: 123, title: 'яйца', value: '3 штуки' }
          ]
        }

        render json: dish, status: :ok
      end

      def change
        d = {
          id: 123,
          title: 'Грушевый салат',
          category: { id: 123, slug: 'breakfast', title: 'Завтрак' },
          image_url: 'http://sdfsdf.com/sdfsdf',
          price: 990
        }

        render json: d, status: :ok
      end
    end
  end
end