# frozen_string_literal: true

require 'rails_helper'
require './spec/support/sign_in_user_helper'

RSpec.configure do |c|
  c.include SignInUserHelper
end

module Queries
  RSpec.describe FetchSkillsByUser, type: :request do
    let(:language) { create(:language) }
    let(:user) { create(:user, verified: true) }
    let!(:skill1) { create(:skill, user:, language:) }
    let!(:skill2) { create(:skill, user:, language:) }
    let(:user2) { create(:user) }
    let!(:skill3) { create(:skill, user: user2, language:) }

    describe '.resolve' do
      it 'fetch skills by user' do
        post '/graphql',
             params: { query: query(user_id: user.id) }

        skill_data = JSON.parse(response.body)['data']['fetchSkillsByUser']
        expect(skill_data.length).to eq 2
      end
    end

    def query(user_id:)
      <<~GQL
        query {
          fetchSkillsByUser(userId: #{user_id}) {
            title
            language {
              name
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
