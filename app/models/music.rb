class Music < ActiveRecord::Base
  self.table_name = 'music'
  validates_presence_of :artist_id, message: 'require artist id.'
  validates_presence_of :title, message: 'require title.'
end
