# frozen_string_literal: true

require 'rails_helper'
require './spec/support/sign_in_user_helper'

RSpec.configure do |c|
  c.include SignInUserHelper
end

module Queries
  RSpec.describe FetchComment, type: :request do
    let(:language) { create(:language) }
    let(:user) { create(:user, verified: true) }
    let(:skill) { create(:skill, user:, language:) }
    let(:comment) { create(:comment, user:, skill:) }

    describe '.resolve' do
      it 'fetch a comment' do
        post '/graphql',
             params: { query: query(comment_id: comment.id) }

        comment_data = JSON.parse(response.body)['data']['fetchComment']
        expect(comment_data['id']).to eq comment.id.to_s
        expect(comment_data['skill']['title']).to eq skill.title
        expect(comment_data['skill']['language']['label']).to eq language.label
        expect(comment_data['user']['name']).to eq user.name
      end

      it 'can not fetch a comment' do
        post '/graphql',
             params: { query: query(comment_id: 150) }

        comment_data = JSON.parse(response.body)['errors'][0]['message']
        expect(comment_data).to eq 'Comment does not exist.'
      end
    end

    def query(comment_id:)
      <<~GQL
        query {
          fetchComment(id: #{comment_id}) {
            id
            body
            skill {
              	title
              	language {
                  label
                }
              	user {
                  name
                  email
                }
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
