# frozen_string_literal: true

require 'rails_helper'
require './spec/support/sign_in_user_helper'

RSpec.configure do |c|
  c.include SignInUserHelper
end

module Queries
  RSpec.describe FetchUserSettings, type: :request do
    let(:user) { create(:user, verified: true) }
    let!(:user_setting) { create(:user_setting, user:) }

    describe '.resolve' do
      it 'fetch user settings' do
        post '/graphql',
             params: { query: }

        setting_data = JSON.parse(response.body)['data']['fetchUserSettings'][0]
        expect(setting_data['firstMonth']).to be true
        expect(setting_data['fiveMonth']).to be true
        expect(setting_data['year']).to be true
        expect(setting_data['user']['id']).to eq user.id.to_s
      end
    end

    def query
      <<~GQL
        query {
          fetchUserSettings(userId: #{user.id}) {
            id
            firstMonth
            fiveMonth
            year
            user {
              id
              name
              email
              verified
            }
          }
        }
      GQL
    end
  end
end
