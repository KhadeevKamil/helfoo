# frozen_string_literal: true

module Import
  class Product
    # TODO: test
    def call(shop_name)
      puts "Start Product for #{shop_name}"
      not_ids = ::IngredientProducts.all.pluck(:ingredient_id).uniq
      ::Ingredients.all.where.not(id: not_ids).each do |ingredient|

        # take one shop
        raw_products = fetch_data(shop_name, ingredient)

        # fill products
        raw_products.each do |raw_product|
          product = ::Product.find_or_initialize_by(
            image_url: raw_product[:image]
          )
          product.assign_attributes(
            title: raw_product[:title],
            shop_name: raw_product[:shop_name],
            price: raw_product[:price]
          )

          if product.save
            puts "Save #{product.title} for #{product.shop_name}"
          else
            puts "Can not save #{product.title} for #{product.shop_name}"
            puts product.errors.full_messages
            next
          end

          # fill ingredient_products
          i_p = IngredientProducts.find_or_initialize_by(
            ingredient_id: ingredient.id,
            product_id: product.id
          )
          if i_p.save
            puts "Save relation for #{product.title}"
          else
            puts "Can not save relation for #{product.title}"
            puts i_p.errors.full_messages
          end
        end
      end
    end

    private

    def fetch_data(shop_name, ingredient)
      if shop_name == 'perekrestok'
        puts "Start perekrestor for #{ingredient.title}"
        ::Scrapers::Perekrestok.new(ingredient.title)
      elsif shop_name == 'lenta'
        puts "Start lenta for #{ingredient.title}"
        ::Scrapers::Lenta.new(ingredient.title)
      elsif shop_name == 'metro'
        puts "Start metro for #{ingredient.title}"
        lenta_raw_products = ::Scrapers::Metro.new(ingredient.title)
      end
    end
  end
end
