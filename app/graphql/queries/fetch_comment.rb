# frozen_string_literal: true

module
   Queries
  class FetchComment < Queries::BaseQuery
    type Types::CommentType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Comment.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Comment does not exist.')
    end
  end
end
