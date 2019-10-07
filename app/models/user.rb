# frozen_string_literal: true

class User < ApplicationRecord
  has_many :familys
  has_many :children, through: :familys
  has_many :microposts
  has_many :growths

  attr_accessor :remember_token
  before_save { self.email = email.downcase }

  validates :name, presence: true,
                   length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true,
                    length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true,
                       length: { minimum: 6 }, allow_nil: true

# rubocop:disable all
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
# rubocop:disable all

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

    def authenticated?(remember_token)
      return false if remember_digest.nil?

      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def forget
      update_attribute(:remember_digest, nil)
    end
  end
