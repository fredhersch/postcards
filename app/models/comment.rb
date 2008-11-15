class Comment < ActiveRecord::Base
  belongs_to  :postcard
  belongs_to  :user
  
  #attr_protected :postcard_id, :user_id
  
  validates_presence_of :comment
  
end
