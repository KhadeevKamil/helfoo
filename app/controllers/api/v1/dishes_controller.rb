# frozen_string_literal: true

module Api
  module V1
    class DishesController < ::Api::V1::ApplicationController
      respond_to :json

      # GET /dishes
      # GET /dishes.json
      def index
        @goal_slug = params[:goal_slug]
        @days = params[:days]

        goal = Goal.find_by(slug: @goal_slug)

        dishes_ids = GoalsDish.where(goal_id: goal.id)

        @dishes = Dish.where(id: dishes_ids)

        render json: @dishes, status: :ok
      end

      # GET /dishes/1
      # GET /dishes/1.json
      def show
        @dish = Dish.find params[:id]

        render json: @dish, status: :ok
      end
    end
  end
end