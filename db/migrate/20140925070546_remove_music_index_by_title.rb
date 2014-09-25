class RemoveMusicIndexByTitle < ActiveRecord::Migration
  def change
    remove_index :music, :title
  end
end
