class Friendship < ActiveRecord::Base
belongs_to :user
<<<<<<< HEAD
    belongs_to :friend, :class_name => "User"
=======
belongs_to :friend, :class_name => 'User'
>>>>>>> aa833e6a306d070bdf5fadaf72091d2f84464f1c
end
