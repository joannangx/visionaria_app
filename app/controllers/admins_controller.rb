class AdminsController < UsersController
  before_filter :ensure_admin!
  require 'csv'
  
  private
  
  def ensure_admin!
    unless current_user.admin?
      sign_out current_user
  
      redirect_to root_path
  
      return false
    end
  end

  def delete_other_posts
  end

end