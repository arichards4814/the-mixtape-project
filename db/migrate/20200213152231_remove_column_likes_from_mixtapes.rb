class RemoveColumnLikesFromMixtapes < ActiveRecord::Migration[6.0]
  def change
    remove_column :mixtapes, :likes
  end
end
