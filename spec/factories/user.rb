# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email  { Faker::Internet.email }
    password { 'Password' }
    verify_id { SecureRandom.uuid }
  end
end
