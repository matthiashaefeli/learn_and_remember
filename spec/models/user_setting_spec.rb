# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserSetting, type: :model do
  let(:user) { create(:user, verified: true) }

  describe 'user setting' do
    it 'is valid with valid attributes' do
      setting = UserSetting.new(user:, first_month: true, five_month: true, year: true)
      expect(setting).to be_valid
    end

    it 'is invalid without a user' do
      setting = UserSetting.new(first_month: true, five_month: true, year: true)
      expect(setting).to_not be_valid
    end
  end
end
