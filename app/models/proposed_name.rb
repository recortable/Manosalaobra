class ProposedName < ActiveRecord::Base
  validates :value, presence: true
end
