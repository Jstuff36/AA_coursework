class ChangeUniquenessConstraintsOfArtwork < ActiveRecord::Migration[5.0]
  def change
    remove_index :artworks, :artist_id
    add_index :artworks, :artist_id
  end
end
