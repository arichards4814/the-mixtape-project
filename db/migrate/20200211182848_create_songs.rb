class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.integer :song_id
      t.string :name 
      t.string :preview_url 
      t.string :artist_name 
      t.string :album 

      t.timestamps
    end 
  end 
end
