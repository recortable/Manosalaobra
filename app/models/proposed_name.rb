class ProposedName < ActiveRecord::Base
  # Relations
  has_many :votes, dependent: :delete_all, order: 'created_at DESC'

  # Validations
  validates :value, presence: true
end
