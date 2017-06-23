class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :name, null: false
      t.boolean :bonus, default: false, null: false
      t.text :lyrics, null: false
      t.timestamps
    end
    add_index :tracks, :album_id
  end
end
