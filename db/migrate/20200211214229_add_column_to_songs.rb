class AddColumnToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :album_url, :string
    add_column :songs, :artist_url, :string
  end
end
