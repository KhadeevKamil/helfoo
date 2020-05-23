# frozen_string_literal: true

module Import
  class Helper
    def self.to_slug(title)
      Translit.convert(title, :english)
              .downcase
              .gsub(/(?:^[\s [[:space:]]]+|[\s [[:space:]]]+$)/, '')
              .gsub(/[\s [[:space:]]]+/, '-')
              .gsub(/[^a-zA-Z0-9-]/, '')
              .gsub(/-{2,}/, '-')
              .strip
    end
  end
end
