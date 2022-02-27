# frozen_string_literal: true

module Queries
  class FetchSkillsByLanguage < Queries::BaseQuery
    type [Types::SkillType], null: false
    argument :language, String, required: true
    argument :page, ID, required: true

    def resolve(language:, page:)
      p = page.to_i
      offset = p == 1 ? 0 : p * 10
      language = Language.find_by(label: language)
      Skill.where(language: language).limit(20).offset(offset).order(created_at: :desc)
    end
  end
end
