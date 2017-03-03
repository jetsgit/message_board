class Message < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  # validates :title, presence: true
  # validates :content, presence: true
  validates_presence_of :title, :content
  self.per_page = 36
end
