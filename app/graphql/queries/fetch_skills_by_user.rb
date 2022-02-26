# frozen_string_literal: true

module Queries
  class FetchSkillsByUser < Queries::BaseQuery
    type [Types::SkillType], null: false
    argument :user_id, ID, required: true
    argument :status, ID, required: true
    argument :page, ID, required: true

    def resolve(user_id:, status:, page:)
      p = page.to_i
      offset = p == 1 ? 0 : p * 10
      Skill.where(user_id: user_id).where(status: status).limit(20).offset(offset).order(created_at: :desc)
    end
  end
end
