# frozen_string_literal: true

# frozen_string_literal: true

module Mutations
  class CreateOrUpdateUserSetting < Mutations::BaseMutation
    argument :params, Types::Input::UserSettingInputType, required: true
    argument :authenticate, Types::Input::AuthenticateInputType, required: true

    field :setting, Types::UserSettingsType, null: false

    def resolve(params:, authenticate:)
      token = authenticate.to_h[:token]
      user = AuthToken.verified_user(token)
      return unless user

      begin
        setting = UserSetting.find_or_create_by(user:)
        setting.first_month = params[:first_month]
        setting.five_month = params[:five_month]
        setting.year = params[:year]
        setting.save!

        { setting: }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
