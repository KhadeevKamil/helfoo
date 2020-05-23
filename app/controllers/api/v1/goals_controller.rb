# frozen_string_literal: true

module Api
  module V1
    class GoalsController < ::Api::V1::ApplicationController
      respond_to :json

      # GET /goals
      # GET /goals.json
      def index
        @goals = Goal.all.select(:id, :title, :slug)

        render json: @goals, status: :ok
      end

      # GET /goals/1
      # GET /goals/1.json
      def show
        @goal = Goal.find params[:id]

        render json: @goal, status: :ok
      end
    end
  end
end
