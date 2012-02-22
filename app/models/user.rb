class User < ActiveRecord::Base
  # RELATIONS
  has_many :comments
  has_many :posts

  # EXTENSIONS
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_secure_password

  # VALIDATIONS
  validates :name, presence: true,
            length: {minimum: 3, maximum: 50}
  validates :email, presence: true,
            uniqueness: true,
            length: {minimum: 5, maximum: 60},
            format: {with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates :password, presence: true, on: :create,
            length: {minimum: 3, maximum: 60},
            confirmation: true

  # El primer usuario siempre será administrador
  def admin?
    self.id == 1 or self.role == 'admin'
  end
end
