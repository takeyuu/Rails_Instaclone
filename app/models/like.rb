class Like < ApplicationRecord
  belongs_to :user
  belongs_to :picture, counter_cache: :likes_count
  validates :user_id, presence: true
  validates :picture_id, presence: true
end
