# frozen_string_literal: true

module Api
  module V1
    class CartsController < ::Api::V1::ApplicationController
      respond_to :json

      def show
        cart =[
          { 
            shop_name: 'Перекресток', 
            slug: 'perek', 
            price: '999',
            products: [
              {
                id: 11,
                title: 'картошка мытая',
                amount: 1,
                image: 'http://dsfsdf.com/sdfsdf.jpg',
                price: 99,
              },
              {
                id: 12,
                title: 'Котлеты Котофей 1 упаковка',
                amount: 3,
                image: 'http://dsfsdf.com/sdfsdf2.jpg',
                price: 300,
              },
            ]
          },
          { 
            shop_name: 'Метро', 
            slug: 'metro', 
            price: '672',
            products: []
          }
        ]
        

        render json: cart, status: :ok
      end
    end
  end
end
