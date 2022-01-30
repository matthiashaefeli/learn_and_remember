# frozen_string_literal: true

module Types
  module Input
    class AuthenticateInputType < Types::BaseInputObject
      argument :token, String, required: true
    end
  end
end
