# frozen_string_literal: true

require 'rails_helper'
require './spec/support/sign_in_user_helper'

RSpec.configure do |c|
  c.include SignInUserHelper
end

module Queries
  RSpec.describe FetchSkills, type: :request do
    let(:language) { create(:language) }
    let(:user) { create(:user) }
    let!(:skill1) { create(:skill, user:, language:) }
    let!(:skill2) { create(:skill, user:, language:) }

    describe '.resolve' do
      it 'fetch skills' do
        post '/graphql',
             params: { query: }

        skill_data = JSON.parse(response.body)['data']['fetchSkills']
        expect(skill_data.length).to eq 2
      end
    end

    def query
      <<~GQL
        query {
          fetchSkills {
            id
            title
            status
        		language {
              name
            }
            user {
              name
              email
              verified
            }
            comments {
              body
              user {
                name
              }
            }
          }
        }
      GQL
    end
  end
end
