# frozen_string_literal: true

namespace :import do
  task all: :environment do
    # 01
    Rake::Task["import:goal"].invoke
    # 02
    Rake::Task["import:ingredient"].invoke
    # 03
    Rake::Task["import:category"].invoke
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
end
