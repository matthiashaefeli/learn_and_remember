# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'name', email: 'e@e.com', password: 'pass')
      expect(user).to be_valid
    end

    it 'is invalid without a email' do
      user = User.new(name: 'name', password: 'pass')
      expect(user).to_not be_valid
    end

    it 'is invalid without a name' do
      user = User.new(email: 'e@e.com', password: 'pass')
      expect(user).to_not be_valid
    end

    it 'is invalid without a password' do
      user = User.new(name: 'name', email: 'e@e.com')
      expect(user).to_not be_valid
    end
  end
end
