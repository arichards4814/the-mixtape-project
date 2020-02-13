class ChangeColumnForMixtapes < ActiveRecord::Migration[6.0]
  def change
    change_column :mixtapes, :cassette_url, :string, default: "cassettes/eighties.png"
    change_column :mixtapes, :background_url, :string, default: "backgrounds/background_1.png"
  end
end
