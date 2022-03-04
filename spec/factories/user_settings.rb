# frozen_string_literal: true

FactoryBot.define do
  factory :user_setting do
    first_month { true }
    five_month { true }
    year { true }
  end
end
