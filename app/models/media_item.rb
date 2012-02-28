class MediaItem < ActiveRecord::Base
  # http://api.rubyonrails.org/classes/ActiveRecord/Store.html
  store :settings, accessors: [ :position ]

  # Upload file
  mount_uploader :file, FileUploader

  POSITIONS = [:left, :center, :right]

  validates :title, presence: true
end
