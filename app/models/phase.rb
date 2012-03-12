class Phase < ActiveRecord::Base
  validates_presence_of :name, :position, :token
  validates_uniqueness_of :token
  default_scope order: 'position ASC'
end
