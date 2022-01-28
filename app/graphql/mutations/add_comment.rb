module Mutations
  class AddComment < Mutations::BaseMutation
    argument :params, Types::Input::CommentInputType, required: true

    field :comment, Types::CommentType, null: false

    def resolve(params:)
      skill = Skill.find(params[:skill_id])
      body = params[:body]
      user = AuthToken.verify(params[:token])
      if user
        begin
          comment = Comment.new(
            body: body,
            skill: skill,
            user: user
          )
          comment.save

          { comment: comment }
        rescue ActiveRecord::RecordInvalid => e
          GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
        end
      end
    end
  end
end