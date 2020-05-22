# frozen_string_literal: true

module Scrapers
  class Metro
    def call(string)
      sleep(0.2)
      products = []
      encoded_query = CGI.escape(string)
      conn = Faraday.new(
        url: "https://delivery.metro-cc.ru/api/stores/1/search_suggestions?q=#{encoded_query}"
      )
      response = conn.get()
      json = JSON.parse(response.body)
      json['suggestion']['offers']&.each do |data|
        next if data.size == 0
        products << data
      end

      products.compact.flatten.map do |offer|
        image = begin
          offer.dig('product', 'images').first['product_url'] || offer.dig('product', 'images').first['preview_url']
        rescue
          'https://pbs.twimg.com/profile_images/1143448737777442816/UngjTfrc_400x400.png'
        end

        {
          price: offer['price'],
          title: offer.dig('product', 'name'),
          image: image,
          shop_name: 'metro'
        }
      end
    end
  end
end
