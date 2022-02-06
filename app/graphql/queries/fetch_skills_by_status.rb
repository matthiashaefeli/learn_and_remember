# frozen_string_literal: true

module Queries
  class FetchSkillsByStatus < Queries::BaseQuery
    type [Types::SkillType], null: false
    argument :status, ID, required: true

    def resolve(status:)
      Skill.where(status: status).order(created_at: :desc)
    end
  end
end
