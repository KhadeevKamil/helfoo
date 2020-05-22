class CreateCategory < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title, null: false, default: ''
      t.string :slug, null: false, default: ''
    end
  end
end
