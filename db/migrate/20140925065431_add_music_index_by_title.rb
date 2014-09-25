class AddMusicIndexByTitle < ActiveRecord::Migration
  def change
    add_index :music, :title
  end
end
