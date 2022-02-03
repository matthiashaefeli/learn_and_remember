# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :comment do
    body { Faker::Movies::BackToTheFuture.quote }
  end
end
