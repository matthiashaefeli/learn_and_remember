# frozen_string_literal: true

module Queries
  class FetchUserSettings < Queries::BaseQuery
    type [Types::UserSettingsType], null: false
    argument :user_id, ID, required: true

    def resolve(user_id:)
      UserSetting.where(user_id: user_id).order(created_at: :desc) # rubocop:disable Style/HashSyntax
    end
  end
end
