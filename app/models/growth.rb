# frozen_string_literal: true

class Growth < ApplicationRecord
  belongs_to :user
  belongs_to :child

  validates :user_id, presence: true
  validates :child_id, presence: true
  validates :weight, presence: true
  validates :height, presence: true
end
