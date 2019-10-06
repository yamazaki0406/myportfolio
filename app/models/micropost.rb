# frozen_string_literal: true

class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :child
  has_many_attached :images

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :child_id, presence: true
  validates :content, presence: true, length: { maximum: 250 }
end
