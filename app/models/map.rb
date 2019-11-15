class Map < ApplicationRecord
  belongs_to :user
  belongs_to :child

  validates :user_id, presence: true
  validates :child_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }
end
