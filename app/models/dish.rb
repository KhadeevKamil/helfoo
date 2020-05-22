# frozen_string_literal: true

# == Schema Information
#
# Table name: dishes
#
#  id            :bigint           not null, primary key
#  title         :string
#  slug          :string
#  image_url     :string
#  calories      :float
#  carbohydrates :float
#  protein       :float
#  category_id   :bigint           not null
#  fat           :float
#  price         :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Dish < ApplicationRecord
end
