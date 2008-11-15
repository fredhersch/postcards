class Vote < ActiveRecord::Base
  belongs_to  :postcard, :counter_cache => true
  belongs_to  :user
end
