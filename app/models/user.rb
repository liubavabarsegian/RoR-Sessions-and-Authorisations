# frozen_string_literal: true

# users
class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :nick, message: 'already exists'
  validates_uniqueness_of :email, message: 'already exists'

  validates :email, presence: true
  validates :nick, presence: true
  validates :password, presence: true
end
