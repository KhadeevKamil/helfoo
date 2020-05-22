# frozen_string_literal: true

module Api
  module V1
    class GoalsController < ::Api::V1::ApplicationController
      respond_to :json

      # GET /goals
      # GET /goals.json
      def index
        @goals = Goal.all

        render json: @goals, status: :ok
      end

      # GET /goals/1
      # GET /goals/1.json
      def show
        @goal = Goal.find params[:id]

        render json: @goal, status: :ok
      end

      private
      
      # Only allow a list of trusted parameters through.
      def goal_params
        params.require(:goal).permit(:title, :slug)
      end
    end
  end
end
