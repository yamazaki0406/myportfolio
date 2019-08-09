class Child < ApplicationRecord
  belongs_to :user
  has_many :growths
  has_many :microposts, dependent: :destroy

  validates :name,     presence: true,
                       length: {maximum: 50}
  validates :sex,      presence: true
  validates :birthday, presence: true
  validates :user_id, presence: true

end
