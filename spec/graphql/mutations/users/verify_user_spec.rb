# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Users
    RSpec.describe VerifyUser, type: :request do
      let!(:user) { create(:user, verified: false) }

      describe '.resolve' do
        it 'verify a user' do
          post '/graphql', params: { query: query(verify_id: user.verify_id) }
          json = JSON.parse(response.body)

          message = json['data']['verifyUser']['message']
          expect(message).to eq 'verified'
        end
      end

      def query(verify_id:)
        <<~GQL
          mutation {
            verifyUser(input: { params: {
              verifyId: "#{verify_id}"}}) {
              message
            }
          }
        GQL
      end
    end
  end
end
