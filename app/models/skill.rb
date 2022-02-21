# frozen_string_literal: true

class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :comments, dependent: :destroy

  validate :title_valid?
  validate :body_valid?

  def title_valid?
    return if title.present?

    errors.add :title, ': not valid'
  end

  def body_valid?
    return if body.present?

    errors.add :body, ': not valid'
  end

  enum status: { 'draft' => 0, 'unpublished' => 1, 'published' => 2 }
end
