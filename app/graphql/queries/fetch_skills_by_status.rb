# frozen_string_literal: true

module Queries
  class FetchSkillsByStatus < Queries::BaseQuery
    type [Types::SkillType], null: false
    argument :status, ID, required: true
    argument :page, ID, required: true

    def resolve(status:, page:)
      p = page.to_i
      offset = p == 1 ? 0 : p * 10
      Skill.where(status: status).limit(20).offset(offset).order(created_at: :desc) # rubocop:disable Style/HashSyntax
    end
  end
end
