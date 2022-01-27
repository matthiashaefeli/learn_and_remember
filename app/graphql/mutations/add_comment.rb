module Mutations
  class AddComment < Mutations::BaseMutation
    argument :params, Types::Input::CommentInputType, required: true

    field :comment, Types::CommentType, null: false

    def resolve(params:)
      comment_params = Hash params

      begin
        binding.pry
      end
    end
  end

end