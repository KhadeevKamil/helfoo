# frozen_string_literal: true

require 'csv'
require 'pry'

module Import
  class Category
    # TODO: test
    def call
      puts 'Start import Category'
      i = 0
      CSV.foreach(Rails.root.join("csvs/dishes.csv"), col_sep: ',', headers: true) do |row|
        i+=1
        category_slug = row['type']

        category = ::Category.find_or_initialize_by(slug: category_slug, title: category_slug)
        if category.new_record?
          if category.save
            puts "Created category '#{category_slug}'"
          else
            puts "Can not create category '#{category_slug}'"
          end
        else
          puts "category '#{category_slug}' alreafy exist"
        end
      end
    end
  end
end
