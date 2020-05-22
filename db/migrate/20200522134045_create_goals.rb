# frozen_string_literal: true

class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :title
      t.string :slug

      t.timestamps
    end
  end
end
