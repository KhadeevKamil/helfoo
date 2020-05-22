# frozen_string_literal: true

class CreateNutritionalValues < ActiveRecord::Migration[6.0]
  def change
    create_table :nutritional_values do |t|
      t.references :dish, null: false, foreign_key: true
      t.string :title
      t.string :value

      t.timestamps
    end
  end
end
