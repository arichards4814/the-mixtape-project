class ChangeColumnInSongs < ActiveRecord::Migration[6.0]
  def change
    change_column :songs, :song_id, :string
  end
end
