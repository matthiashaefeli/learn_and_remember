# frozen_string_literal: true

require 'rails_helper'
require './spec/support/sign_in_user_helper'

RSpec.configure do |c|
  c.include SignInUserHelper
end

module Queries
  RSpec.describe FetchComment, type: :request do
    let(:language) { create(:language) }
    let(:user) { create(:user) }
    let(:skill) { create(:skill, user:, language:) }
    let(:comment) { create(:comment, user:, skill:) }

    describe '.resolve' do
      it 'fetch a comment' do
        post '/graphql',
             params: { query: query(comment_id: comment.id) }

        comment_data = JSON.parse(response.body)['data']['fetchComment']
        expect(comment_data['id']).to eq comment.id.to_s
        expect(comment_data['skill']['title']).to eq skill.title
        expect(comment_data['skill']['language']['name']).to eq language.name
        expect(comment_data['user']['name']).to eq user.name
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
                  name
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
