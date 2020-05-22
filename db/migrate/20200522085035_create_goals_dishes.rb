class CreateGoalsDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :goals_dishes do |t|
      t.references :goal, null: false, foreign_key: true
      t.references :dished, null: false, foreign_key: true
    end
  end
end
