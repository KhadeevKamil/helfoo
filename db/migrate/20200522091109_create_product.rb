class CreateProduct < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title, null: false, default: ''
      t.string :shop_name
      t.string :price
      t.string :image_url
    end
  end
end
