class Skill < ApplicationRecord
  belongs_to :user

  enum status: [:draft, :unpublished, :published]
end
