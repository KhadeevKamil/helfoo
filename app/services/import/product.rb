# frozen_string_literal: true

# Product.all.where(shop_name: 'lenta').joins(:ingredient).group('ingredients.id').count
# items = Ingredient.all.select { |i| i.product.where(shop_name: 'metro').count <= 0 };
module Import
  class Product
    # TODO: test
    def call(shop_name)
      puts "Start Product for #{shop_name}"
      not_ids = ::IngredientProduct.all.joins(:product).where(products: { shop_name: shop_name }).pluck(:ingredient_id).uniq
      i = 0
      scope = if not_ids.size > 0
        ::Ingredient.all.where.not(id: not_ids)
      else
        ::Ingredient.all
      end
      scope.each do |ingredient|
        i += 1
        # next if i > 3
        # take one shop
        raw_products = fetch_data(shop_name, ingredient)

        puts "We have #{raw_products.size} raw products"
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
            puts "Save #{product.title} (#{product.price}) for #{product.shop_name}"
          else
            puts "Can not save #{product.title} (#{product.price}) for #{product.shop_name}"
            puts product.errors.full_messages
            next
          end

          # fill ingredient_products
          i_p = IngredientProduct.find_or_initialize_by(
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
        puts "Start perekrestok for #{ingredient.title}(#{ingredient.id})"
        ::Scrapers::Perekrestok.new.call(ingredient.title)
      elsif shop_name == 'lenta'
        puts "Start lenta for #{ingredient.title}(#{ingredient.id})"
        ::Scrapers::Lenta.new.call(ingredient.title)
      elsif shop_name == 'metro'
        puts "Start metro for #{ingredient.title}(#{ingredient.id})"
        lenta_raw_products = ::Scrapers::Metro.new.call(ingredient.title)
      end
    end
  end
end
