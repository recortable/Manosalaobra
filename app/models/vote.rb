class Vote < ActiveRecord::Base
  belongs_to :name, counter_cache: true
end
