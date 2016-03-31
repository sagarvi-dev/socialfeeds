class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider
 def self.find_for_oauth(auth)
    identity = find_by(provider: auth.provider, uid: auth.uid)
    identity = create(uid: auth.uid, provider: auth.provider) if identity.nil?
    identity.email=auth.info.email
    identity.accesstoken = auth.credentials.token
    identity.refreshtoken = auth.credentials.refresh_token
    identity.save
    identity
  end
end
   #  def self.find_with_omniauth(auth)
   #   find_by(uid: auth['uid'], provider: auth['provider'])
   # end

   #  def self.create_with_omniauth(auth)
   #    create(uid: auth['uid'], provider: auth['provider'])
   #  end

    #def self.find_for_oauth(auth)
 # find_by(provider: auth.provider, uid: auth.uid)
    #identity = create(uid: auth.uid, provider: auth.provider) if identity.nil?
   #identity.accesstoken = auth.credentials.token
   #identity.refreshtoken = auth.credentials.refresh_token
   #identity.name = auth.info.name
    #identity.email = auth.info.email
    #identity.nickname = auth.info.nickname
    #identity.image = auth.info.image
    #identity.phone = auth.info.phone
    #identity.urls = (auth.info.urls || "").to_json
   #identity.save
   #identity  
   # where(provider: auth.provider, uid: auth.uid).first_or_create do |identity|
    #   identity.provider = auth.provider
     #  identity.uid = auth.uid
   #    user.email = auth.info.email 
  #     user.password = Devise.friendly_token[0,20]    
    # end
   # end
  
