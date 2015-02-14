class OmniauthCallbacksController < Devise::OmniauthCallbacksController 
after_filter :store_location

  
  def linkedin
    auth = env["omniauth.auth"]
    @user = User.connect_to_linkedin(request.env["omniauth.auth"],current_user)
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.linkedin_uid"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
   end
  
  protected
    
  def auth_hash
    request.env['omniauth.auth']
  end
  
  def store_location
      session[:return_to] = request.fullpath
    end
  
  def after_sign_in_path_for(resource)
   if request.env['omniauth.origin']
      request.env['omniauth.origin']
    end
end

end 

