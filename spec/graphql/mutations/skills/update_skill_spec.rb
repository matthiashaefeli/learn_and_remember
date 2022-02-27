# frozen_string_literal: true

require 'rails_helper'
require './spec/support/sign_in_user_helper'

RSpec.configure do |c|
  c.include SignInUserHelper
end

module Mutations
  module Skills
    RSpec.describe UpdateSkill, type: :request do
      let(:language) { create(:language) }
      let(:user) { create(:user, verified: true) }
      let!(:skill) { create(:skill, user:, language:) }

      describe '.resolve' do
        it 'update a skill' do
          token = get_token(user)
          expect do
            post '/graphql',
                 params: { query: query(token:,
                                        title: 'title_test',
                                        language: language.label,
                                        status: 0,
                                        body: '<p>test</p>',
                                        id: skill.id) }
          end.to change { Skill.count }.by(0)
          skill.reload
          expect(skill.language).to eq language
          expect(skill.status).to eq 'draft'
          expect(skill.body).to eq '<p>test</p>'
        end

        it 'return error if title missing' do
          token = get_token(user)
          post '/graphql',
               params: { query: query(token:,
                                      title: '',
                                      language: language.label,
                                      status: 0,
                                      body: '<p>test<p>',
                                      id: skill.id) }

          error_response = JSON.parse(response.body)['errors'][0]['message']
          expect(error_response).to eq 'Invalid attributes for Skill: Title : not valid'
        end
      end

      def query(token:, title:, language:, status:, body:, id:)
        <<~GQL
          mutation {
            updateSkill(input: {
                authenticate: {
                  token: "#{token}"
                },
                params: {
                  id: #{id},
                  title: "#{title}",
                  body: "#{body}",
                  language: "#{language}",
                  status: #{status}
                }
            }) {
              skill {
              id
              title
              status
          		language {
                label
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
