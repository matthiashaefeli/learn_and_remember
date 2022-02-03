# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Users
    RSpec.describe AddUser, type: :request do
      describe '.resolve' do
        it 'create a user' do
          expect do
            post '/graphql', params: { query: query(name: 'test', email: 't@t.com', password: 'pass') }
          end.to change { User.count }.by(1)
        end

        it 'can not create a user' do
          post '/graphql', params: { query: query(name: '', email: 't@t.com', password: 'pass') }
          error_response = JSON.parse(response.body)['errors'][0]['message']
          expect(error_response).to eq "Invalid attributes for User: Name can't be blank"
        end
      end

      def query(name:, email:, password:)
        <<~GQL
          mutation {
            addUser(input: {
              params: {
                name: "#{name}",
                email: "#{email}",
                password: "#{password}" }})
            {
              authenticate {
                token
              }
              user {
                name
                email
              }
            }
          }
        GQL
      end
    end
  end
end
