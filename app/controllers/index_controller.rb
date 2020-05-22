# frozen_string_literal: true

class IndexController < ApplicationController
  def index
    render json: { message: 'Hello!' }
  end
end
