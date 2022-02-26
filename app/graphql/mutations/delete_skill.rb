# frozen_string_literal: true

module Mutations
  class DeleteSkill < Mutations::BaseMutation
    argument :skill_id, Int, required: true
    argument :authenticate, Types::Input::AuthenticateInputType, required: true

    field :skill, Types::SkillType, null: false

    def resolve(skill_id:, authenticate:)
      token = authenticate.to_h[:token]
      user = AuthToken.verified_user(token)
      return unless user

      begin
        skill = Skill.find(skill_id)
        skill.destroy!

        { skill: }
      rescue ActiveRecord::RecordNotFound => e
        GraphQL::ExecutionError.new(e)
      end
    end
  end
end
