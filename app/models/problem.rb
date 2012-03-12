class Problem < ActiveRecord::Base
  belongs_to :user
  belongs_to :phase

  store :settings, accesors: []

  # VALIDATIONS
  validates_presence_of :title, :user_id, :phase_id


end
