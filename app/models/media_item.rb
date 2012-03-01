class MediaItem < ActiveRecord::Base
  # http://api.rubyonrails.org/classes/ActiveRecord/Store.html
  store :settings, accessors: [ :position ]

  # Upload file
  mount_uploader :file, FileUploader

  POSITIONS = [:left, :center, :right, :float_left, :float_right]

  validates :title, presence: true
end
