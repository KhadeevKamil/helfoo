# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :shop_name
      t.string :price
      t.string :image_url

      t.timestamps
    end
  end
end
