# frozen_string_literal: true

module Queries
  class FetchLanguages < Queries::BaseQuery
    type [Types::LanguageType], null: false

    def resolve
      Language.all.order(label: :asc)
    end
  end
end
