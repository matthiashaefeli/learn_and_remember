# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :name, :password_digest, presence: true
  validates :email, presence: true, uniqueness: true
  validate :email_valid?

  def email_valid?
    return if email&.match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)

    errors.add :email, ': not valid'
  end
end
