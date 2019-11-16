# frozen_string_literal: true

class Album < ApplicationRecord
  belongs_to :user
  belongs_to :child
  has_many_attached :images
end
