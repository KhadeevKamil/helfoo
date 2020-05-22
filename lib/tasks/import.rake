# frozen_string_literal: true

namespace :import do
  task all: :environment do
    # 01
    Rake::Task['import:goals'].invoke
    # 02
    Rake::Task['import:ingredients'].invoke
  end

  task goal: :environment do
    Import::Goal.new.call
  end

  task ingredient: :environment do
    Import::Ingredient.new.call
  end
end
