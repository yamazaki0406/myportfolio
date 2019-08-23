class Child < ApplicationRecord
  has_many :familys
  has_many :users, through: :familys
  has_many :growths
  has_many :microposts, dependent: :destroy
  has_many_attached :images

  validates :name,     presence: true, length: {maximum: 50}
  validates :sex,      presence: true
  validates :birthday, presence: true
  validates :user_id,  presence: true

end
