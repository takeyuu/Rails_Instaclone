class User < ApplicationRecord
  mount_uploader :icon_image, ImageUploader
  has_many :pictures
  has_many :likes, dependent: :destroy
  has_many :like_pictures, through: :likes, source: :picture
  has_many :coments, dependent: :destroy
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, length: { minimum: 6 }
end
