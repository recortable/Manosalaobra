class MediaItem < ActiveRecord::Base
  # http://api.rubyonrails.org/classes/ActiveRecord/Store.html
  store :settings, accessors: [ :position ]

  POSITIONS = [:left, :center, :right]

  validates :title, presence: true
end
