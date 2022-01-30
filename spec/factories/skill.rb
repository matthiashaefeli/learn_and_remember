# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :skill do
    title { Faker::Movies::Ghostbusters }
  end
end
