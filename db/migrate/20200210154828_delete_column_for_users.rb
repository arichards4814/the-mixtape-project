class DeleteColumnForUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :current_badge
  end
end
