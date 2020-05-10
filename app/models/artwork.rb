class Artwork < ApplicationRecord
  mount_uploader :content, ImageUploader
end
