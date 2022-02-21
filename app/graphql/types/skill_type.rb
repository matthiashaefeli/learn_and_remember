# frozen_string_literal: true

module Types
  class SkillType < Types::BaseObject
    field :id, ID, null: false
    field :user, UserType
    field :title, String, null: false
    field :body, String, null: false
    field :language, LanguageType
    field :status, String, null: false
    field :comments, [CommentType]
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
