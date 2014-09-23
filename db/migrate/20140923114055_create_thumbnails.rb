class CreateThumbnails < ActiveRecord::Migration
  def change
    create_table :thumbnails do |t|
      t.integer :video_id
      t.string :url

      t.timestamps
    end
  end
end
