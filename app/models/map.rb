# frozen_string_literal: true

class Map < Album
  belongs_to :user
  belongs_to :child

  before_save { self.content = content.gsub(/(\r\n|\r|\n)/, '') }

  validates :user_id, presence: true, numericality: true
  validates :child_id, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true
  validates :latitude, presence: true, numericality: true
  validates :content, presence: true, length: { maximum: 50 }
end
