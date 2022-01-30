# frozen_string_literal: true

module Types
  class AuthenticateType < Types::BaseObject
    field :token, String, null: true
  end
end
