module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :skill_id, Integer, null: true
    field :user_id, Integer, null: true
    field :body, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
