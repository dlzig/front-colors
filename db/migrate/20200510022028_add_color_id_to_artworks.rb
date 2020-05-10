class AddColorIdToArtworks < ActiveRecord::Migration[5.2]
  def change
    add_reference :artworks, :color, foreign_key: true
  end
end
