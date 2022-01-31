# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Users
    RSpec.describe AddUser, type: :request do
      describe '.resolve' do
        it 'creates a user' do
          expect do
            post '/graphql', params: { query: query(name: 'test', email: 't@t.com', password: 'pass') }
          end.to change { User.count }.by(1)
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
