class Artwork < ApplicationRecord
  belongs_to :color
  belongs_to :user
  mount_uploader :content, ImageUploader
  validates :title, presence: true, length: { maximum: 30 }
  
  # お気に入り機能
  has_many :favorites
  has_many :liker, through: :favorites, source: :user
  
end
