# frozen_string_literal: true

# == Schema Information
#
# Table name: nutritional_values
#
#  id         :bigint           not null, primary key
#  dish_id    :bigint           not null
#  title      :string
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class NutritionalValue < ApplicationRecord
  belongs_to :dish
end
