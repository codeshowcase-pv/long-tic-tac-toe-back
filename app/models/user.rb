# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :name, :password_digest, presence: true
  validates :login, presence: true, uniqueness: true
end
