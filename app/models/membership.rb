class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates :group_id, presence: true
  validates :user_id, presence: true,
    uniqueness: {scope: :group_id}
end
