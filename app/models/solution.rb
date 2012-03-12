class Solution < ActiveRecord::Base
  belongs_to :problem
  belongs_to :user
  belongs_to :phase

  validates_presence_of :problem_id, :user_id, :phase_id, :title

  # EXTENSIONS
  extend FriendlyId
  friendly_id :title, use: :slugged
end
