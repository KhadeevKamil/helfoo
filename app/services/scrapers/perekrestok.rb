# frozen_string_literal: true

require 'faraday'
require 'nokogiri'

module Scrapers
  class Perekrestok
    def call(string)
      sleep(0.2)
      products = []
      encoded_query = CGI.escape(string)
      url = "https://www.perekrestok.ru/prompt?text=#{encoded_query}&withTemplate=true"
      conn = Faraday.new(url: url)
      response = conn.get()
      json = JSON.parse(response.body)
      json['results'].select do |item|
        item['entity'] == 'product'
      end.each do |item|
        products << item
      end

      products.compact.flatten.map do |item|
        html_doc = Nokogiri::HTML(item['template'])
        image = begin
          html_doc.css('img[data-src]').first['data-src']
        rescue
          'https://potrebnadzor.ru/files/1850/company-19950.jpg'
        end

        {
          price: item['price'],
          title: item['text'],
          image: image,
          shop_name: 'perekrestok'
        }
      end
    end
  end
end
