# frozen_string_literal: true

module Mutations
  class SignInUser < Mutations::BaseMutation
    argument :params, Types::Input::UserInputType, required: true

    field :authenticate, Types::AuthenticateType, null: false
    field :user, Types::UserType, null: false

    def resolve(params:)
      email = params[:email]
      name = params[:name]

      user = User.find_by(email:, name:)
      return unless user&.verified
      return unless user.authenticate(params[:password])

      {
        authenticate: { token: AuthToken.token(user) },
        user:
      }
    end
  end
end
