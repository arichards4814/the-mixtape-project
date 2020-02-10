class CreateMixtapes < ActiveRecord::Migration[6.0]
  def change
    create_table :mixtapes do |t|
      t.string :title
      t.string :message
      t.string :cassette_url
      t.string :background_url
      t.integer :user_id
      t.integer :likes

      t.timestamps
    end
  end
end
