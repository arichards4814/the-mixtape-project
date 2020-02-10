class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :current_badge, :string, default: "badges/default.png"
  end
end
