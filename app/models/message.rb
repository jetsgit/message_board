class Message < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates_presence_of :title, :content
  self.per_page = 10
end
