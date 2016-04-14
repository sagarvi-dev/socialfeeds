class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable, 
         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:facebook,:twitter]
  has_many :identities
  has_many :messages, dependent: :delete_all
  has_many :friendships
<<<<<<< HEAD
  has_many :passive_friendships, :class_name => "Friendship", :foreign_key => "friend_id"

  has_many :active_friends, -> { where(friendships: { approved: true}) }, :through => :friendships, :source => :friend
  has_many :passive_friends, -> { where(friendships: { approved: true}) }, :through => :passive_friendships, :source => :user
  has_many :pending_friends, -> { where(friendships: { approved: false}) }, :through => :friendships, :source => :friend
  has_many :requested_friendships, -> { where(friendships: { approved: false}) }, :through => :passive_friendships, :source => :user

    def friends
      active_friends | passive_friends
    end
=======
  has_many :friends, :through => :friendships
>>>>>>> aa833e6a306d070bdf5fadaf72091d2f84464f1c

   def self.from_omniauth(auth)
    # identity = Identity.where(:provider => auth.provider, :uid => auth.uid, :accesstoken => auth.credentials.token ).first_or_create do |user|
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      #user.provider = auth.provider
      #user.uid = auth.uid
        user.avatar = auth.info.image 
        user.email = auth.info.email || "#{auth.uid}@#{auth.provider}.com"
        user.password = Devise.friendly_token[0,20]
        user.save
        user
      end
    


end

 # def self.new_with_session(params, session)
 #     super.tap do |user|
 #       if data = session["devise.#{provider}_data"] && session["devise.#{provider}_data"]["extra"]["raw_info"]
 #         user.email = data["email"] if user.email.blank?
 #       end
 #     end
 #   end

# def self.new_with_session(params, session)
#     super.tap do |user|
#       if data = session["devise.twitter_data"] && session["devise.twitter_data"]["extra"]["raw_info"]
#         user.email = data["email"] if user.email.blank?
#       end
#     end
#   end  

end
