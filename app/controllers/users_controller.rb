class UsersController < ApplicationController
    before_filter :authenticate_user!
    
    def view_spanish
        @user = current_user
        @user.update_attribute(:spanish, true)
        redirect_to(:back)
    end
    
    def view_english
        @user = current_user
        @user.update_attribute(:spanish, false)
        redirect_to(:back)
    end    
end