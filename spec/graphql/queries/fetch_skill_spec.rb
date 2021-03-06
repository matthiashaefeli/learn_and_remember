# frozen_string_literal: true

require 'rails_helper'
require './spec/support/sign_in_user_helper'

RSpec.configure do |c|
  c.include SignInUserHelper
end

module Queries
  RSpec.describe FetchSkill, type: :request do
    let(:language) { create(:language) }
    let(:user) { create(:user, verified: true) }
    let(:skill) { create(:skill, user:, language:) }

    describe '.resolve' do
      it 'fetch a skill' do
        post '/graphql',
             params: { query: query(skill_id: skill.id) }

        skill_data = JSON.parse(response.body)['data']['fetchSkill']
        expect(skill_data['id']).to eq skill.id.to_s
        expect(skill_data['status']).to eq skill.status
        expect(skill_data['language']['label']).to eq language.label
        expect(skill_data['user']['name']).to eq user.name
        expect(skill_data['comments']).to be_instance_of Array
      end

      it 'can not fetch a skill' do
        post '/graphql',
             params: { query: query(skill_id: 150) }

        skill_data = JSON.parse(response.body)['errors'][0]['message']
        expect(skill_data).to eq 'Skill does not exist.'
      end
    end

    def query(skill_id:)
      <<~GQL
        query {
          fetchSkill(id: #{skill_id}) {
            id
            title
            body
            status
        		language {
              label
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
