# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:language) { create(:language) }
  let(:skill) { create(:skill, user:, language:) }

  describe 'comment' do
    it 'is valid with valid attributes' do
      comment = Comment.new(user:, skill:, body: 'test')
      expect(comment).to be_valid
    end

    it 'is invalid without a user' do
      comment = Comment.new(skill:, body: 'test')
      expect(comment).to_not be_valid
    end

    it 'is invalid without a skill' do
      comment = Comment.new(user:, body: 'test')
      expect(comment).to_not be_valid
    end

    it 'is invalid without a body' do
      comment = Comment.new(user:, skill:)
      expect(comment).to be_valid
    end
  end
end
