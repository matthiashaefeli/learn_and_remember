# frozen_string_literal: true

module Queries
  class FetchLanguages < Queries::BaseQuery
    type [Types::LanguageType], null: false

    def resolve
      Language.all.order(name: :asc)
    end
  end
end
