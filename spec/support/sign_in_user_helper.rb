# frozen_string_literal: true

require 'rails_helper'

module SignInUserHelper
  def get_token(user)
    post '/graphql', params: { query: sign_in_query(name: user.name, email: user.email, password: user.password) }
    json = JSON.parse(response.body)
    json['data']['signInUser']['authenticate']['token']
  end

  def sign_in_query(name:, email:, password:)
    <<~GQL
      mutation {
        signInUser(input: { params: {
          name: "#{name}",
          email: "#{email}",
          password: "#{password}" }}) {
          authenticate {
            token
          }
          user {
            name
            email
            verified
          }
        }
      }
    GQL
  end
end
