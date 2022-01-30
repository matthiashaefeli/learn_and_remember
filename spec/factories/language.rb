# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :language do
    name { Faker::Creature::Animal }
  end
end
