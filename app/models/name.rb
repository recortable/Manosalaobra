class Name < ActiveRecord::Base
  validates :proposed_name, presence: true
end
