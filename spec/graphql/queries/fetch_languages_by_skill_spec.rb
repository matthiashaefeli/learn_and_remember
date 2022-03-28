# frozen_string_literal: true

require 'rails_helper'
require './spec/support/sign_in_user_helper'

RSpec.configure do |c|
  c.include SignInUserHelper
end

module Queries
  RSpec.describe FetchLanguages, type: :request do
    let!(:language1) { create(:language) }
    let!(:language2) { create(:language) }

    describe '.resolve' do
      it 'fetch no languages' do
        post '/graphql',
             params: { query: }

        language_data = JSON.parse(response.body)['data']['fetchLanguagesBySkill']
        expect(language_data.length).to eq 0
      end
    end

    describe 'languages' do
      let(:user) { create(:user, verified: true) }
      let!(:skill) { create(:skill, language: language1, user:) }
      it 'fetch languages' do
        post '/graphql',
             params: { query: }

        language_data = JSON.parse(response.body)['data']['fetchLanguagesBySkill']
        expect(language_data.length).to eq 1
      end
    end

    def query
      <<~GQL
        query {
          fetchLanguagesBySkill {
            label
          }
        }
      GQL
    end
  end
end
