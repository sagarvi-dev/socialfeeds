class CallbacksController < Devise::OmniauthCallbacksController
 
 #   def facebook
 #       auth = request.env['omniauth.auth']
   
 #     @user = User.from_omniauth(request.env["omniauth.auth"])
 #     @identity = Identity.find_for_omniauth(request.env["omniauth.auth"])
    
 #     if @user.persisted?
 #       sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
 #       set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
 #     else
 #       session["devise.facebook_data"] = request.env["omniauth.auth"]
 #       redirect_to new_user_registration_url
 #     end
 # end
#     def twitter
#      @user = User.from_omniauth(request.env["omniauth.auth"])

#     if @user.persisted?
#       sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
#       set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
#     else
#       session["devise.twitter_data"] = request.env["omniauth.auth"]
#       redirect_to new_user_registration_url
#     end
#   end 

   def failure
     redirect_to root_path
   end

 def facebook
    generic_callback( 'facebook' )
  end

  def twitter
    generic_callback( 'twitter' )
  end

 def generic_callback( provider )
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @identity = Identity.find_for_oauth env["omniauth.auth"]

    @identity.user = @user || current_user
    if @user.nil?
      @user = User.create( email: @identity.email || "" )
      @identity.update_attribute( :user_id, @user.id )
    end

    if @user.email.blank? && @identity.email
      @user.update_attribute( :email, @identity.email)
    end

    if @user.persisted?
      @identity.update_attribute( :user_id, @user.id )
      
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

end