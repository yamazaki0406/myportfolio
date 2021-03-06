# frozen_string_literal: true

class Child < ApplicationRecord
  has_many :families
  has_many :users, through: :families
  has_many :growths
  has_many_attached :images
  has_many :albums, dependent: :destroy
  has_many :microposts, dependent: :destroy
  has_many :maps, dependent: :destroy

  validates :name,     presence: true, length: { maximum: 50 }
  validates :sex,      presence: true
  validates :birthday, presence: true
  validates :user_id, presence: true
  validate :date_check

  def date_check
    if birthday.blank?
      nil
    else
      errors.add(:birthday, 'の入力内容に誤りがあります。') unless birthday <= Date.today
    end
  end
end
