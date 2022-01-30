# frozen_string_literal: true

module Queries
  class FetchComments < Queries::BaseQuery
    type [Types::CommentType], null: false

    def resolve
      Comment.all.order(created_at: :desc)
    end
  end
end
