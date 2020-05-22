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
    puts '05'
    Rake::Task['import:nutritional_value'].invoke
    puts '06.1'
    Rake::Task['import:product:perekrestok'].invoke
    puts '06.2'
    Rake::Task['import:product:lenta'].invoke
    puts '06.3'
    Rake::Task['import:product:metro'].invoke
  end

  task goal: :environment do
    Import::Goal.new.call
  end

  task ingredient: :environment do
    Import::Ingredient.new.call('dishes')
  end

  task category: :environment do
    Import::Category.new.call('dishes')
  end

  task dish: :environment do
    Import::Dish.new.call('dishes')
  end

  task nutritional_value: :environment do
    Import::NutritionalValue.new.call
  end

  namespace :product do
    task perekrestok: :environment do
      Import::Product.new.call('perekrestok')
    end

    task lenta: :environment do
      Import::Product.new.call('lenta')
    end

    task metro: :environment do
      Import::Product.new.call('metro')
    end
  end
end
