class Artwork < ApplicationRecord
  belongs_to :color
  belongs_to :user
  mount_uploader :content, ImageUploader
#  validates :title, presence: true, lenght: { maximum: 30 }
end
