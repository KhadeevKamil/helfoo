# frozen_string_literal: true

module Api
  module V1
    class DishesController < ::Api::V1::ApplicationController
      respond_to :json

      # GET /dishes
      # GET /dishes.json
      def index
        dishes_with_days = []
        i = 1

        goal_slug = params[:goal_slug]
        days = params[:days]

        days.to_i.times do 
          dishes_with_days << {
            day: i,
            dishes: get_dishes(goal_slug)
          }
          i += 1
        end

        # binding.pry
        render json: DishesSerializer.new(dishes_with_days).to_json, status: :ok
      end

      # GET /dishes/1
      # GET /dishes/1.json
      def show
        # binding.pry
        dish = Dish.find params[:id]

        render json: dish, serializer: DishSerializer, status: :ok
      end

      def change
        d = {
          id: 123,
          title: 'Грушевый салат',
          category: { id: 123, slug: 'breakfast', title: 'Завтрак' },
          image_url: 'https://mir-s3-cdn-cf.behance.net/projects/max_808/5a244277673529.Y3JvcCwyMzYxLDE4NDYsMCwxOTI.png',
          price: 990
        }

        render json: d, status: :ok
      end

      private 
      
      def get_dishes(goal_slug)
        goal_id = Goal.find_by(slug: goal_slug).id

        dishes_ids = GoalsDish.where(goal_id: goal_id).map { |t| t.dish_id }

        dishes = Dish.where(id: dishes_ids)
      end
    end
  end
end