class Vote < ActiveRecord::Base
  belongs_to :proposed_name, counter_cache: true
end
