# frozen_string_literal: true

namespace :import do
  task goals: :environment do
    Import::Goal.call
  end
end
