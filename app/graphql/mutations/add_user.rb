# frozen_string_literal: true

module Mutations
  class AddUser < Mutations::BaseMutation
    argument :params, Types::Input::UserInputType, required: true

    field :authenticate, Types::AuthenticateType, null: false
    field :user, Types::UserType, null: false

    def resolve(params:)
      user_params = Hash params
      begin
        user = User.create!(user_params)
        # VerifyMailer.with(user: user).verify_email.deliver_later

        { user: }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
