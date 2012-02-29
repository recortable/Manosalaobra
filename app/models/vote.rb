class Vote < ActiveRecord::Base
  # Relations
  belongs_to :proposed_name, counter_cache: true

  # Validations
  validates :value, presence: true
  validates :proposed_name_id, presence: true
  validates :request_ip, presence: true

  after_save :update_votes_value
  after_destroy :decrement_votes_value

  protected
  def update_votes_value
    new_value = self.proposed_name.votes_value + self.value
    self.proposed_name.update_attribute(:votes_value, new_value)
  end

  def decrement_votes_value
    new_value = self.proposed_name.votes_value - self.value
    self.proposed_name.update_attribute(:votes_value, new_value)    
  end
end
