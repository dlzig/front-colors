class Color < ApplicationRecord
  validates :hue, presence: true, length: { maximum: 50 }
  has_many :artworks
end
