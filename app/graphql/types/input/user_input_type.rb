# frozen_string_literal: true

module Types
  module Input
    class UserInputType < Types::BaseInputObject
      argument :name, String, required: true
      argument :email, String, required: true
      argument :password, String, required: true
    end
  end
end
