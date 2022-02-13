# frozen_string_literal: true

module Types
  class LanguageType < Types::BaseObject
    field :name, String, null: false
    field :id, Int, null: false
  end
end
