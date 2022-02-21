# frozen_string_literal: true

require 'rails_helper'
require './spec/support/sign_in_user_helper'

RSpec.configure do |c|
  c.include SignInUserHelper
end

module Queries
  RSpec.describe FetchSkillsByStatus, type: :request do
    let(:language) { create(:language) }
    let(:user) { create(:user, verified: true) }
    let!(:skill1) { create(:skill, user:, language:) }
    let!(:skill2) { create(:skill, user:, language:, status: 1) }
    let(:user2) { create(:user) }
    let!(:skill3) { create(:skill, user: user2, language:, status: 1) }

    describe '.resolve' do
      it 'fetch skills by status' do
        post '/graphql',
             params: { query: }

        skill_data = JSON.parse(response.body)['data']['fetchSkillsByStatus']
        expect(skill_data.length).to eq 2
      end
    end

    def query
      <<~GQL
        query {
          fetchSkillsByStatus(status: 1) {
            title
            body
            language {
              label
            }
            user {
              name
              email
              verified
            }
            status
          }
        }
      GQL
    end
  end
end
