class Comment < ApplicationRecord
  validates :user_id,:presence => true
  validates :photo_id, :presence => true
  validates :body, :presence => true
end
