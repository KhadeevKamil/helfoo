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

        render json: DishesSerializer.new(dishes_with_days).to_json, status: :ok
      end

      # GET /dishes/1
      # GET /dishes/1.json
      def show
        dish = Dish.find params[:dish_id]

        render json: dish, serializer: DishSerializer, status: :ok
      end

      def change
        dish_id = params[:dish_id]

        dish = Dish.find_by(id: dish_id)
        goal_slug = dish.goals.first
        c_slug = Category.find dish.category_id

        d = Dish.where(category_id: c_slug.id).where.not(id: dish.id).first

        render json: d, serializer: DishSerializer, status: :ok
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