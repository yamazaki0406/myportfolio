class Child < ApplicationRecord
  has_many :familys
  has_many :users, through: :familys
  has_many :growths
  has_many :microposts, dependent: :destroy
  has_many_attached :images

  validates :name,     presence: true, length: {maximum: 50}
  validates :sex,      presence: true
  validates :user_id,  presence: true
  validate :date_check

  def date_check
    errors.add(:birthday,"の入力内容に誤りがあります。") unless self.birthday <= Date.today
  end

end
