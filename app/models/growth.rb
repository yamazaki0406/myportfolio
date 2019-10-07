# frozen_string_literal: true

class Growth < ApplicationRecord
  belongs_to :user
  belongs_to :child

  validates :user_id, presence: true
  validates :child_id, presence: true
  validates :weight, presence: true
  validates :height, presence: true

  scope :search, lambda { |search_params|
    return if search_params.blank?

    date_from(search_params[:date_from]).date_to(search_params[:date_to])
  }
  scope :date_from, ->(from) { where('? <= date', from) if from.present? }
  scope :date_to, ->(to) { where('date <= ?', to) if to.present? }
end
