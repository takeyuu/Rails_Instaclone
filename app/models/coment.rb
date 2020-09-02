class Coment < ApplicationRecord
  belongs_to :user
  belongs_to :picture
  validates :user_id, presence: true
  validates :picture_id, presence: true
  validates :content, presence:true
end
