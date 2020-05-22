# frozen_string_literal: true

class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :title
      t.string :slug
      t.string :image_url
      t.float :calories
      t.float :carbohydrates
      t.float :protein
      t.references :category, null: false, foreign_key: true
      t.float :fat
      t.float :price

      t.timestamps
    end
  end
end
