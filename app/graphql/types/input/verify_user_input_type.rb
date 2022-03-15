# frozen_string_literal: true

module Types
  module Input
    class VerifyUserInputType < Types::BaseInputObject
      argument :verify_id, String, required: true
    end
  end
end
