class RegistrationsController < Devise::RegistrationsController
  after_filter :build_profile, only: :create

  private

  def sign_up_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation, :provider, :uid, :avatar)
  end

  def account_update_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation, :current_password, :avatar)
  end

  def build_profile
    @user = current_user
    @profile = Profile.create({:user_id => @user.id})
    @user.profile = @profile
  end  

end