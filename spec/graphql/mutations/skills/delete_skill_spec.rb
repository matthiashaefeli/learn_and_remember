# frozen_string_literal: true

require 'rails_helper'
require './spec/support/sign_in_user_helper'

RSpec.configure do |c|
  c.include SignInUserHelper
end

module Mutations
  module Skills
    RSpec.describe DeleteSkill, type: :request do
      let(:language) { create(:language) }
      let(:user) { create(:user, verified: true) }
      let(:skill) { create(:skill, user:, language:) }
      let!(:comment) { create(:comment, user:, skill:) }

      describe '.resolve' do
        it 'destroy a skill' do
          token = get_token(user)
          expect do
            post '/graphql',
                 params: { query: query(token:, skill_id: skill.id) }
          end.to change { Skill.count }.by(-1)
        end

        it 'return error if skill does not exist' do
          token = get_token(user)
          post '/graphql',
               params: { query: query(token:, skill_id: 200) }

          error_response = JSON.parse(response.body)['errors'][0]['message']
          expect(error_response).to eq "Couldn't find Skill with 'id'=200"
        end
      end

      def query(token:, skill_id:)
        <<~GQL
          mutation {
            deleteSkill(input: {
                authenticate: {
                  token: "#{token}"
                },
                skillId: #{skill_id}
            }) {
              skill {
              id
              }
            }
          }
        GQL
      end
    end
  end
end
