class Content < ActiveRecord::Base
  validates :title, presence: true
  validates :content_type, presence: true

end