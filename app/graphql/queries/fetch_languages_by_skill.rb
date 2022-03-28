# frozen_string_literal: true

module Queries
  class FetchLanguagesBySkill < Queries::BaseQuery
    type [Types::LanguageType], null: false

    def resolve
      Skill.includes(:language).map(&:language).uniq.sort
    end
  end
end
