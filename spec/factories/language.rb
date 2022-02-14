# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :language do
    label { Faker::Games::Zelda.character }
  end
end
