class Video < ActiveRecord::Base
  has_one :thumbnail, foreign_key: "video_id"
  validates :title, presence: true
  validates_uniqueness_of :title
end
