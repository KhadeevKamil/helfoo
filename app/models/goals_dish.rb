# frozen_string_literal: true

# == Schema Information
#
# Table name: goals_dishes
#
#  id         :bigint           not null, primary key
#  dish_id    :bigint           not null
#  goal_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GoalsDish < ApplicationRecord
  belongs_to :dish
  belongs_to :goal
end
