class Picture < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :coments, dependent: :destroy
  has_many :coment_users, through: :coments, source: :user
  validates :image, presence: true
  validates :articla, presence: true
end
