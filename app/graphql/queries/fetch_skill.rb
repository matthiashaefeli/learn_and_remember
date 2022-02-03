# frozen_string_literal: true

module Queries
  class FetchSkill < Queries::BaseQuery
    type Types::SkillType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Skill.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Skill does not exist.')
    end
  end
end
