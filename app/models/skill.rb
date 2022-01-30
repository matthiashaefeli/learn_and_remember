class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :comments

  enum status: [:draft, :unpublished, :published]
end
