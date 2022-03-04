# frozen_string_literal: true

module Types
  class UserSettingsType < Types::BaseObject
    field :id, ID, null: false
    field :user, UserType
    field :first_month, Boolean
    field :five_month, Boolean
    field :year, Boolean
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
