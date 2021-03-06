# frozen_string_literal: true

require 'csv'

module Import
  class Ingredient
    # TODO: test
    def call(file_name)
      puts 'Start import Ingredient'
      i = 0
      CSV.foreach(Rails.root.join("csvs/#{file_name}.csv"), col_sep: ',', headers: true) do |row|
        i += 1
        # next if i > 3 # TODO: delete me
        [
          row['Item 1'],
          row['Item 2'],
          row['Item 3'],
          row['Item 4'],
          row['Item 5'],
          row['Item 6'],
          row['Item 7'],
          row['Item 8']
        ].each do |ingredient_name|
          next if ingredient_name.nil? || ingredient_name.empty?

          ingredient = ::Ingredient.find_or_initialize_by(title: ingredient_name)
          if ingredient.new_record?
            if ingredient.save
              puts "Created ingredient '#{ingredient_name}'"
            else
              puts "Can not create ingredient '#{ingredient_name}'"
            end
          else
            puts "Ingredient '#{ingredient_name}' alreafy exist"
          end
        end
      end
    end
  end
end
