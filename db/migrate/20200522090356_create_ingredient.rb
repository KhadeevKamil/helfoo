class CreateIngredient < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :title, null: false, default: ''
    end
  end
end
