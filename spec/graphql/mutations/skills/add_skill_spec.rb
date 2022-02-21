# frozen_string_literal: true

require 'rails_helper'
require './spec/support/sign_in_user_helper'

RSpec.configure do |c|
  c.include SignInUserHelper
end

module Mutations
  module Skills
    RSpec.describe AddSkill, type: :request do
      let(:language) { create(:language) }
      let(:user) { create(:user, verified: true) }

      describe '.resolve' do
        it 'creates a skill' do
          token = get_token(user)
          expect do
            post '/graphql',
                 params: { query: query(token:, title: 'title_test',
                                        language: language.label,
                                        status: 0,
                                        body: '<p>test<p>') }
          end.to change { Skill.count }.by(1)
        end

        it 'return error if title missing' do
          token = get_token(user)
          post '/graphql',
               params: { query: query(token:, title: '', language: language.label, status: 0, body: '<p>test<p>') }

          error_response = JSON.parse(response.body)['errors'][0]['message']
          expect(error_response).to eq 'Invalid attributes for Skill: Title : not valid'
        end
      end

      def query(token:, title:, language:, status:, body:)
        <<~GQL
          mutation {
            addSkill(input: {
                authenticate: {
                  token: "#{token}"
                },
                params: {
                  title: "#{title}",
                  body: "#{body}",
                  language: "#{language}",
                  status: #{status}
                }
            }) {
              skill {
              id
              title
              status
          		language {
                label
              }
              user {
                name
                email
                verified
              }
              }
            }
          }
        GQL
      end
    end
  end
end
