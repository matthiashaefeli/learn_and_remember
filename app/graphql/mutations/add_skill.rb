module Mutations
  class AddSkill < Mutations::BaseMutation
    argument :params, Types::Input::SkillInputType, required: true

    field :skill, Types::SkillType, null: false

    def resolve(params:)
      language = params[:language]
      title = params[:title]
      status = params[:status]
      user = AuthToken.verify(params[:token])

      begin
        skill = Skill.new(language: language,
                          title: title,
                          status: status,
                          user: user)

                          binding.pry
        skill.save

        { skill: skill }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
