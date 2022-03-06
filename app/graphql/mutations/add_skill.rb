# frozen_string_literal: true

module Mutations
  class AddSkill < Mutations::BaseMutation
    argument :params, Types::Input::SkillInputType, required: true
    argument :authenticate, Types::Input::AuthenticateInputType, required: true

    field :skill, Types::SkillType, null: false

    def resolve(params:, authenticate:)
      Rails.logger.info 'AddSkill Mutation: start resolve'
      token = authenticate.to_h[:token]
      user = AuthToken.verified_user(token)
      Rails.logger.info 'AddSkill Mutation: User verified'
      return unless user

      begin
        Rails.logger.info 'AddSkill Mutation: create skill'
        skill = Skill.new(skill_params(params.to_h, user))
        Rails.logger.info "AddSkill Mutation: skill valid: #{skill.valid?}"
        skill.save!

        Rails.logger.info "AddSkill Mutation: skill: #{skill}"
        { skill: }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end

    def skill_params(params, user)
      language = Language.find_by(label: params[:language])
      params[:user] = user
      params[:language] = language
      params
    end
  end
end
