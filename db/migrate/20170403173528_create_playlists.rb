class CreatePlaylists < ActiveRecord::Migration[5.0]
  def change
    create_table :playlists do |t|
      t.belongs_to :user, index: true
      t.string :name

      t.timestamps
    end
  end
end
