class CreateDishInrgedients < ActiveRecord::Migration[6.0]
  def change
    create_table :dish_inrgedients do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.string :amount
    end
  end
end
