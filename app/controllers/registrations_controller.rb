class RegistrationsController < Devise::RegistrationsController
  after_filter :build_profile, only: :create
  after_filter :initiate_points_sys, only: :create

  private

  def sign_up_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation, :provider, :uid, :avatar)
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
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation, :current_password, :avatar)
  end

  def build_profile
    @user = current_user
    @profile = Profile.create({:user_id => @user.id})
    @user.profile = @profile
  end  

  def initiate_points_sys
    @user = current_user
    @vision_point = @user.points.create({:variety => "Visions"})
    @goals = TaggedPost.all_un_goals
    @goals.each do |goal|
      @user.points.create({:variety => goal})
    end  
  end  
  
end