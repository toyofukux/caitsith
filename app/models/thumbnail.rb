class Thumbnail < ActiveRecord::Base
  belongs_to :video, touch: true
end
