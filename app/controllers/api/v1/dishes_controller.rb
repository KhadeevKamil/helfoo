# frozen_string_literal: true

module Api
  module V1
    class DishesController < ::Api::V1::ApplicationController
      respond_to :json

      # DONE!
      def index
        dishes_with_days = []
        i = 1

        goal_slug = params[:goal_slug]
        days = params[:days] || 1

        days.to_i.times do
          dishes_with_days << {
            day: i,
            dishes: get_dishes_for_one_day(goal_slug)
          }
          i += 1
        end

        render json: DishesSerializer.new(dishes_with_days).as_json[:result], status: :ok
      end

      # DONE!
      def show
        dish = Dish.find params[:id]

        render json: dish, serializer: DishSerializer, status: :ok
      end

      # DONE!
      def change
        selected_dish = Dish.find_by(id: params[:dish_id])
        dish = Dish.where(category_id: selected_dish.category_id)
                   .where.not(id: selected_dish.id).reorder('RANDOM()').first

        render json: dish, serializer: DishSerializer, status: :ok
      end

      private

      def get_dishes_for_one_day(goal_slug)
        goal_id = Goal.find_by(slug: goal_slug).id
        default_scope = Dish.joins(:goals).where(goals: { id: goal_id })

        # RANDOM() doesn't work with joins :(
        [
          default_scope.breakfast.sample,
          default_scope.lunch.sample,
          default_scope.desert.sample,
          default_scope.salat.sample,
          default_scope.drink.sample
        ].compact
      end
    end
  end
end
