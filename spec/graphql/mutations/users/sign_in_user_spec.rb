# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Users
    RSpec.describe SignInUser, type: :request do
      let(:user) { create(:user, verified: true) }
      let(:user2) { create(:user) }

      describe '.resolve' do
        it 'sign in a user' do
          post '/graphql', params: { query: query(name: user.name, email: user.email, password: user.password) }
          json = JSON.parse(response.body)
          user = json['data']['signInUser']['user']
          authenticate = json['data']['signInUser']['authenticate']
          expect(user).to include(
            'name' => be_present,
            'email' => be_present,
            'verified' => true
          )
          expect(authenticate).to include(
            'token' => be_present
          )
        end

        it 'can not sign in a user' do
          post '/graphql', params: { query: query(name: user.name, email: 'other_email', password: user.password) }
          json = JSON.parse(response.body)
          user = json['data']['signInUser']
          expect(user).to be_nil
        end

        it 'user is not verified' do
          post '/graphql', params: { query: query(name: user2.name, email: user2.email, password: user2.password) }
          json = JSON.parse(response.body)
          user = json['data']['signInUser']
          expect(user).to be_nil
        end
      end

      def query(name:, email:, password:)
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
  end
end
