# frozen_string_literal: true

require 'rails_helper'
require './spec/support/sign_in_user_helper'

RSpec.configure do |c|
  c.include SignInUserHelper
end

module Mutations
  module Comments
    RSpec.describe AddComment, type: :request do
      let(:language) { create(:language) }
      let(:user) { create(:user) }
      let(:skill) { create(:skill, user:, language:) }

      describe '.resolve' do
        it 'creates a comment' do
          token = get_token(user)
          expect do
            post '/graphql',
                 params: { query: query(token:, body: 'comment_test', skill_id: skill.id) }
          end.to change { Comment.count }.by(1)
        end

        it 'returns an error if not skill not found' do
          token = get_token(user)
          post '/graphql',
               params: { query: query(token:, body: 'comment_test', skill_id: 120) }
          error_response = JSON.parse(response.body)['errors'][0]['message']
          expect(error_response).to eq "Couldn't find skill with id:120"
        end

        it 'returns an error if body nil' do
          token = get_token(user)
          post '/graphql',
               params: { query: query(token:, body: nil, skill_id: skill.id) }

          error_response = JSON.parse(response.body)['errors'][0]['message']
          expect(error_response).to eq 'Invalid attributes for Comment: Body : not valid'
        end
      end

      def query(token:, body:, skill_id:)
        <<~GQL
          mutation {
            addComment(input: {
              authenticate: {
                token: "#{token}"
              },
              params: {
                body: "#{body}",
                skillId: #{skill_id}
              }
            })
            {
              comment {
                body
                skill {
                  title
                }
          			user {
                  email
                  name
                }
              }
            }
          }
        GQL
      end
    end
  end
end
