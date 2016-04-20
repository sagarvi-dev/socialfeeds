class Friendship < ActiveRecord::Base
belongs_to :user
belongs_to :friend, :class_name => 'User'
belongs_to :user_friend, :class_name => 'User', :foreign_key => 'friend_id'
end
