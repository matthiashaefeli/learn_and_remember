# frozen_string_literal: true

class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :comments, dependent: :destroy

  enum status: { 'draft' => 0, 'unpublished' => 1, 'published' => 2 }
end
