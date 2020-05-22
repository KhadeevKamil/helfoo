# frozen_string_literal: true

module Import
  class Goal
    def call
      puts 'Start import Goals'
      [
        ['Сбросить вес', 'sbrosit_ves'],
        ['Набрать массу', 'nabrat_massu'],
        ['Стать энергичнее', 'stat_energichnee'],
        ['Быть здоровым', 'byt_zdorovym'],
        ['Похудеть после родов', 'pohudet'],
        ['Питаться с учетом аллергии', 'alergy']
      ].each do |goal_name, goal_slug|
        if Goal.find_by(slug: goal_slug).present?
          puts "Goal '#{goal_name}'/#{goal_slug} alreafy exist"
        elsif Goal.create(title: goal_name, slug: goal_slug)
          puts "Created goal '#{goal_name}'/#{goal_slug}"
        else
          puts "Can create goal '#{goal_name}'/#{goal_slug}"
        end
      end
    end
  end
end
