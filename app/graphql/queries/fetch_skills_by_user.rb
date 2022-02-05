# frozen_string_literal: true

module Queries
  class FetchSkillsByUser < Queries::BaseQuery
    type [Types::SkillType], null: false
    argument :user_id, ID, required: true

    def resolve(user_id:)
      Skill.where(user_id: user_id).order(created_at: :desc)
    end
  end
end
