class CreateNutritionalValue < ActiveRecord::Migration[6.0]
  def change
    create_table :nutritional_values do |t|
      t.references :dished, null: false, foreign_key: true
      t.string :title, null: false, default: ''
      t.string :value
    end
  end
end
