# frozen_string_literal: true

require 'rails_helper'
require './spec/support/sign_in_user_helper'

RSpec.configure do |c|
  c.include SignInUserHelper
end

module Mutations
  module Skills
    RSpec.describe AddSkill, type: :request do
      let(:language) { create(:language) }
      let(:user) { create(:user) }
      describe '.resolve' do
        it 'creates a skill' do
          token = get_token(user)
          expect do
            post '/graphql',
                 params: { query: query(token:, title: 'title_test', language_id: language.id, status: 0) }
          end.to change { Skill.count }.by(1)
        end
      end

      def query(token:, title:, language_id:, status:)
        <<~GQL
          mutation {
            addSkill(input: {
                authenticate: {
                  token: "#{token}"
                },
                params: {
                  title: "#{title}",
                  languageId: #{language_id},
                  status: #{status}
                }
            }) {
              skill {
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
              }
            }
          }
        GQL
      end
    end
  end
end
