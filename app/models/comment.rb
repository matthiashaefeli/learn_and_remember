# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :skill

  validate :body_valid?

  def body_valid?
    return if body.present?

    errors.add :body, ': not valid'
  end
end
