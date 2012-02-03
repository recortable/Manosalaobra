class Name < ActiveRecord::Base
  has_many :votes
  
  validates :proposed_name, presence: true
end
