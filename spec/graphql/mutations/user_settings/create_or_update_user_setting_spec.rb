# frozen_string_literal: true

require 'rails_helper'
require './spec/support/sign_in_user_helper'

RSpec.configure do |c|
  c.include SignInUserHelper
end

module Mutations
  module UserSettings
    RSpec.describe CreateOrUpdateUserSetting, type: :request do
      let!(:user) { create(:user, verified: true) }
      let!(:user2) { create(:user, verified: true) }
      let!(:setting) { create(:user_setting, user:) }

      describe '.resolve' do
        it 'update a user setting' do
          token = get_token(user)
          expect do
            post '/graphql',
                 params: { query: query(token:, first_month: true, five_month: false, year: false) }
          end.to change { UserSetting.count }.by(0)
          expect(setting.five_month).to be true
          setting.reload
          expect(setting.five_month).to be false
        end

        it 'create a user setting' do
          token = get_token(user2)
          expect do
            post '/graphql',
                 params: { query: query(token:, first_month: true, five_month: false, year: false) }
          end.to change { UserSetting.count }.by(1)
        end
      end

      def query(token:, first_month:, five_month:, year:)
        <<~GQL
          mutation {
            createOrUpdateUserSetting(input: {
                authenticate: {
                  token: "#{token}"
                },
                params: {
                  firstMonth: #{first_month},
                  fiveMonth: #{five_month},
                  year: #{year}
                }
            }) {
              setting {
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
          }
        GQL
      end
    end
  end
end
