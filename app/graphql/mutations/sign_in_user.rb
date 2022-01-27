module Mutations
  class SignInUser < Mutations::BaseMutation
    argument :params, Types::Input::UserInputType, required: true

    field :authenticate, Types::AuthenticateType, null: false
    field :user, Types::UserType, null: false

    def resolve(params:)
      email = params[:email]
      name = params[:name]

      begin
        user = User.find_by(email: email, name: name)
        return unless user
        return unless user.authenticate(params[:password])

        {
          authenticate: {token: AuthToken.token(user)},
          user: user
        }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end