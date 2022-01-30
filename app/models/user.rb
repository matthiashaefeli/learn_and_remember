# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :name, :password_digest, presence: true
  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true
end
