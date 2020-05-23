# frozen_string_literal: true

class ChangePrice < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :price, :string
    add_column :products, :price, :float
  end
end
