# frozen_string_literal: true

class CreateGoalsDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :goals_dishes do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
