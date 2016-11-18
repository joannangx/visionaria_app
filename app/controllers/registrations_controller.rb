class RegistrationsController < Devise::RegistrationsController
  
  private

  def sign_up_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation, :provider, :uid)
  end
  
  def after_sign_up_path_for(resource)
    case resource
      when :user, User
        if User.admins.include?(resource.email)
          resource.admin = true
          resource.save!
        end
        after_sign_in_path_for(resource)
      else
        super
    end
  end

  def account_update_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation, :current_password)
  end

end