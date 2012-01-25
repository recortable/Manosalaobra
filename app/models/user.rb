class User < ActiveRecord::Base
  validates :name, :presence => true,
                   :length => {:minimum => 3, :maximum => 50}
  validates :mail, :presence => true, 
                   :uniqueness => true,
                   :length => {:minimum => 3, :maximum => 60},
                   :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates :password, :presence => true,
                       :length => {:minimum => 3, :maximum => 60}
end
