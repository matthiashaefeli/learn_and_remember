# frozen_string_literal: true

module Queries
  class FetchSkills < Queries::BaseQuery
    type [Types::SkillType], null: false

    def resolve
      Skill.all.order(created_at: :desc)
    end
  end
end
