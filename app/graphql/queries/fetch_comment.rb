module Queries
  class FetchComment < Queries::BaseQuery
    type Types::CommentType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Comment.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Comment does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
