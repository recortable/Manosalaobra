class Content < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true
  validates :content_type, presence: true

  before_save :clean_input

  # Devuelve el valor del un atributo con el locale especificado.
  # Si el valor del atributo está vacío, devuelve el valor por defecto (locale = 'es')
  # @param attribute [String] El nombre del atributo
  # @param locale [String] El locale especificado
  def localized(attribute, locale)
    locale = locale.to_s.downcase
    if locale == 'es'
      send(attribute)
    else
      localized = send("#{attribute}_#{locale}")
      localized.present? ? localized : send(attribute)
    end
  end

  private 

    def clean_input
      self.body = self.body.sanitize if self.body.present?
      self.body_ca = self.body_ca.sanitize if self.body_ca.present?
    end
end