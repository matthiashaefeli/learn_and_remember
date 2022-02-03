# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Skill, type: :model do
  let(:user) { create(:user) }
  let(:language) { create(:language) }

  describe 'skill' do
    it 'is valid with valid attributes' do
      skill = Skill.new(language:, user:, title: 'test')
      expect(skill).to be_valid
    end

    it 'is invalid without a user' do
      skill = Skill.new(language:, title: 'test')
      expect(skill).to_not be_valid
    end

    it 'is invalid without a language' do
      skill = Skill.new(user:, title: 'test')
      expect(skill).to_not be_valid
    end

    it 'is invalid without a title' do
      skill = Skill.new(language:, user:)
      expect(skill).to_not be_valid
    end
  end
end
