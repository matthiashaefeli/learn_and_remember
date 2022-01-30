# frozen_string_literal: true

module Mutations
  class AddComment < Mutations::BaseMutation
    argument :params, Types::Input::CommentInputType, required: true
    argument :authenticate, Types::Input::AuthenticateInputType, required: true

    field :comment, Types::CommentType, null: false

    def resolve(params:, authenticate:)
      skill = Skill.find(params[:skill_id])
      body = params[:body]
      token = authenticate.to_h[:token]
      user = AuthToken.verified_user(token)
      return unless user

      begin
        comment = Comment.new(
          body:,
          skill:,
          user:
        )
        comment.save

        { comment: }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
