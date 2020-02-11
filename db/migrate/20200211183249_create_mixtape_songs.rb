class CreateMixtapeSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :mixtape_songs do |t|
      t.integer :song_id
      t.integer :mixtape_id

      t.timestamps
    end
  end
end
