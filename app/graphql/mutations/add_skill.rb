module Mutations
  class AddSkill < Mutations::BaseMutation
    argument :params, Types::Input::SkillInputType, required: true

    field :skill, Types::SkillType, null: false

    def resolve(params:)
      skill_params = Hash params

      begin
        skill = Skill.create!(skill_params)

        { skill: skill }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
