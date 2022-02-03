# frozen_string_literal: true

module Mutations
  class AddSkill < Mutations::BaseMutation
    argument :params, Types::Input::SkillInputType, required: true
    argument :authenticate, Types::Input::AuthenticateInputType, required: true

    field :skill, Types::SkillType, null: false

    def resolve(params:, authenticate:)
      skill_params = params.to_h
      token = authenticate.to_h[:token]
      user = AuthToken.verified_user(token)
      return unless user

      begin
        skill = Skill.new(skill_params)
        skill.user = user
        skill.save!

        { skill: }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
