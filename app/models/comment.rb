class Comment < ActiveRecord::Base
  belongs_to :message
  belongs_to :user
  validates_presence_of :comment 
end
