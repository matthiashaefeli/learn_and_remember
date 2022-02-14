# frozen_string_literal: true

require 'rails_helper'
require './spec/support/sign_in_user_helper'

RSpec.configure do |c|
  c.include SignInUserHelper
end

module Queries
  RSpec.describe FetchComments, type: :request do
    let(:language) { create(:language) }
    let(:user) { create(:user, verified: true) }
    let(:skill) { create(:skill, user:, language:) }
    let!(:comment1) { create(:comment, user:, skill:) }
    let!(:comment2) { create(:comment, user:, skill:) }

    describe '.resolve' do
      it 'fetch comments' do
        post '/graphql',
             params: { query: }

        comment_data = JSON.parse(response.body)['data']['fetchComments']
        expect(comment_data.length).to eq 2
      end
    end

    def query
      <<~GQL
        query {
          fetchComments {
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
