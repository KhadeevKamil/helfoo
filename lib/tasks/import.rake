# frozen_string_literal: true

namespace :import do
  task all: :environment do
    puts '01'
    Rake::Task["import:goal"].invoke
    puts '02'
    Rake::Task["import:ingredient"].invoke
    puts '03'
    Rake::Task["import:category"].invoke
    puts '04'
    Rake::Task["import:dish"].invoke
  end

  task goal: :environment do
    Import::Goal.new.call
  end

  task ingredient: :environment do
    Import::Ingredient.new.call
  end

  task category: :environment do
    Import::Category.new.call
  end

  task dish: :environment do
    Import::Dish.new.call
  end
end
