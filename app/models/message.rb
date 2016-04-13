class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend
  validates :body, presence: true, length: {maximum: 2000}
end
