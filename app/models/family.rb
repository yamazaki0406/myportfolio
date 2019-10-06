# frozen_string_literal: true

class Family < ApplicationRecord
  belongs_to :child
  belongs_to :user

  validates :child_id, presence: true
  validates :user_id, presence: true
end
