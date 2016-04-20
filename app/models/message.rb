class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
  validates :body, presence: true, length: {maximum: 2000}
end
