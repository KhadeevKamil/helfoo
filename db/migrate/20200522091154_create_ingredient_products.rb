# frozen_string_literal: true

class CreateIngredientProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredient_products do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
    end
  end
end
