class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  after_filter :build_profile
    
  def build_profile
      @user = current_user
      @profile = Profile.create({:user_id => @user.id})
      @user.profile = @profile
  end  
    
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"].except("extra")
      flash[:notice] = "ERROR: Email associated with Facebook account is already in use"
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
  
  def google_oauth2
      @user = User.from_omniauth(request.env["omniauth.auth"])
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.google_data"] = request.env["omniauth.auth"].except("extra")
        flash[:notice] = "ERROR: Email associated with Google account is already in use"
        redirect_to new_user_registration_url
      end
  end
  
end