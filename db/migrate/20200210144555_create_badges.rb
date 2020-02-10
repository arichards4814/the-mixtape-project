class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :image_url
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
