# frozen_string_literal: true

# == Schema Information
#
# Table name: dish_inrgedients
#
#  id            :bigint           not null, primary key
#  dish_id       :bigint           not null
#  ingredient_id :bigint           not null
#  amount        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class DishInrgedient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient
end
