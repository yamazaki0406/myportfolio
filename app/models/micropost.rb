class Micropost < ApplicationRecord
  belongs_to :child
  default_scope -> {order(created_at: :desc)}
  validates :child_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
end
