# frozen_string_literal: true

module Api
  module V1
    class CartsController < ::Api::V1::ApplicationController
      respond_to :json

      # api/v1/carts?dish_ids[]=1&dish_ids[]=2
      def index
        days = params[:days].to_i || 1
        carts = []
        dishes = Dish.where(id: (params[:dish_ids] || []))
        ingredients = dishes.map(&:ingredient).compact.flatten.uniq

        data = [:perekrestok, :lenta, :metro].map do |shop_slug|
          current_products = []

          ingredients.map(&:id).each do |ingr_id|
            current_product = get_one_product(ingr_id, shop_slug)
            current_products << current_product
          end
          current_products.uniq!
          current_products.map!{ |i| ProductSerializer.new(i).as_json }

          price = current_products
                .map { |i| (i[:price] * i[:amount]) || 0 }
                .reduce(:+)

          carts << {
            shop_name: get_shop_name(shop_slug),
            slug: shop_slug,
            price: (price || 0).round(2),
            products: current_products
          }
        end
        render json: carts, status: :ok
      end

      private

      def get_one_product(ingr_id, shop_slug)
        Product.joins(:ingredient)
          .where(ingredients: {id: ingr_id})
          .where(shop_name: shop_slug)
          .order(price: :asc)
          .limit(1).first
      end

      def get_shop_name(slug)
        case slug.to_s
        when 'perekrestok'
          'Перекресток'
        when 'lenta'
          'Лента'
        else
          'Метро'
        end
      end
    end
  end
end
