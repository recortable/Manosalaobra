class ProposedName < ActiveRecord::Base
  # Relations
  has_many :votes, dependent: :delete_all

  # Validations
  validates :value, presence: true
end
