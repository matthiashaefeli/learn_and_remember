# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :language do
    name { Faker::Games::Zelda.character }
  end
end
