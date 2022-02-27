# frozen_string_literal: true

module Mutations
  class UpdateSkill < Mutations::BaseMutation
    argument :params, Types::Input::SkillInputType, required: true
    argument :authenticate, Types::Input::AuthenticateInputType, required: true

    field :skill, Types::SkillType, null: false

    def resolve(params:, authenticate:)
      token = authenticate.to_h[:token]
      user = AuthToken.verified_user(token)
      return unless user

      begin
        skill = update_skill(params)

        { skill: }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end

    def update_skill(params)
      skill = Skill.find(params[:id])
      language = Language.find_by(label: params[:language])
      skill.title = params[:title]
      skill.language = language
      skill.body = params[:body]
      skill.status = params[:status]
      skill.save!
      skill
    end
  end
end
