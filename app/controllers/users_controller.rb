class UsersController < ApplicationController
    before_filter :authenticate_user!
    
    def user_params
        params.require(:user).permit(:username, :name, :email, :avatar)
    end    
    
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
    
    def self.spanish?
       return self.spanish 
    end    
    
    def index
          @users = User.all

        csv_string_users = CSV.generate do |csv|
               csv << ["Id", "Username", "Name", "Email"]
               @users.each do |user|
                 csv << [user.id, user.username, user.name, user.email]
               end
          end         
        
        send_data csv_string_users,
        :type => 'text/csv; charset=iso-8859-1; header=present',
        :disposition => "attachment; filename=users.csv" 
    end    
    
    def edit
        
    end
    
    def update
        
    end    
end