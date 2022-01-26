module Queries
  class FetchSkill < Queries::BaseQuery
    type Types::SkillType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Skill.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Skill does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
