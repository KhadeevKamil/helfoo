# frozen_string_literal: true

module Api
  module V1
    class ApplicationController < ActionController::API
      before_action :set_raven_context

      private

      def set_raven_context
        Raven.extra_context(params: params.to_unsafe_h, url: request.url)
      end
    end
  end
end
