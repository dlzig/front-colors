class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  # お気に入り機能
  has_many :artworks
  has_many :favorites, dependent: :destroy
  has_many :fav_posts, through: :favorites, source: :artwork
  
  def like(artwork)
    favorites.find_or_create_by(artwork_id: artwork.id)
  end
  
  def unlike(artwork)
    favorite = self.favorites.find_by(artwork_id: artwork.id)
    favorite.destroy if favorite
  end
  
  def add_favorite?(artwork)
    self.fav_posts.include?(artwork)
    #has_manyで定義したfav_postにする
  end
  
end
