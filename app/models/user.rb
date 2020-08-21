class User < ApplicationRecord
  has_many :pictures
  has_many :likes, dependent: :destroy
  has_many :like_pictures, through: :likes, source: :picture
  has_many :coments, dependent: :destroy
end
