class CreateDished < ActiveRecord::Migration[6.0]
  def change
    create_table :disheds do |t|
      t.string :title, null: false, default: ''
      t.string :slug, null: false, default: ''
      t.references :category, null: false, foreign_key: true
      t.string :image_url
      t.float :calories
      t.float :carbohydrates
      t.float :protein
      t.float :fat
      t.float :price

      t.timestamps null: false
    end
  end
end
