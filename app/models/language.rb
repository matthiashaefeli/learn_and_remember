# frozen_string_literal: true

class Language < ApplicationRecord
  has_many :skills, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
