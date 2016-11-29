class UsersController < ApplicationController
    before_filter :authenticate_user!
    
    def view_spanish
        @user = current_user
        puts @user.spanish
        @user.update_attribute(:spanish, true)
        puts @user.spanish
        #redirect_to posts_path
        redirect_to(:back)
    end
    
    def view_english
        @user = current_user
        puts @user.spanish
        @user.update_attribute(:spanish, false)
        puts @user.spanish
        #redirect_to posts_path
        redirect_to(:back)
    end    
end