# frozen_string_literal: true

require 'rails_helper'
require './spec/support/sign_in_user_helper'

RSpec.configure do |c|
  c.include SignInUserHelper
end

module Queries
  RSpec.describe FetchSkillsByLanguage, type: :request do
    let(:language1) { create(:language) }
    let(:language2) { create(:language) }
    let(:user) { create(:user, verified: true) }
    let!(:skill1) { create(:skill, user:, language: language1, status: 2) }
    let!(:skill2) { create(:skill, user:, language: language2, status: 2) }

    describe '.resolve' do
      it 'fetch skills by language' do
        post '/graphql',
             params: { query: }

        skill_data = JSON.parse(response.body)['data']['fetchSkillsByLanguage']
        expect(skill_data.length).to eq 1
      end
    end

    def query
      <<~GQL
        query {
          fetchSkillsByLanguage(language: "#{language1.label}", page: 1) {
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
