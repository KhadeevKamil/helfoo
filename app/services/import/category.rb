# frozen_string_literal: true

require 'csv'

module Import
  class Category
    # TODO: test
    def call(file_name)
      puts 'Start import Category'
      i = 0
      CSV.foreach(Rails.root.join("csvs/#{file_name}.csv"), col_sep: ',', headers: true) do |row|
        i+=1
        category_slug = row['type']

        category = ::Category.find_or_initialize_by(slug: category_slug, title: category_slug)
        if category.new_record?
          if category.save
            puts "Created category '#{category_slug}'"
          else
            puts "Can not create category '#{category_slug}' => #{category.errors.full_messages}"
          end
        else
          puts "category '#{category_slug}' alreafy exist"
        end
      end
    end
  end
end
