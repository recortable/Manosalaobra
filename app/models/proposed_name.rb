class ProposedName < ActiveRecord::Base
  # Relations
  has_many :votes

  # Validations
  validates :value, presence: true
end
