# frozen_string_literal: true

module Import
  class Product
    # TODO: test
    def call
      not_ids = ::IngredientProducts.all.pluck(:ingredient_id).uniq
      ::Ingredients.all.where.not(id: not_ids).each do |ingredient|

        # take one shop
        # fill products
        # fill ingredient_products

        # save all
      end
    end
  end
end
