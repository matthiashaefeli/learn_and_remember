# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :skill do
    title { Faker::Movies::Ghostbusters.quote }
    body { Faker::Lorem.sentence(word_count: 20) }
  end
end
