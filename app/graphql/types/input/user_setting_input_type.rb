# frozen_string_literal: true

module Types
  module Input
    class UserSettingInputType < Types::BaseInputObject
      argument :first_month, Boolean, required: true
      argument :five_month, Boolean, required: true
      argument :year, Boolean, required: true
    end
  end
end
