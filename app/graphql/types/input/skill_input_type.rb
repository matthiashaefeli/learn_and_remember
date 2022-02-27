# frozen_string_literal: true

module Types
  module Input
    class SkillInputType < Types::BaseInputObject
      argument :title, String, required: true
      argument :body, String, required: true
      argument :language, String, required: true
      argument :status, Integer, required: true
      argument :id, Integer, required: false
    end
  end
end
