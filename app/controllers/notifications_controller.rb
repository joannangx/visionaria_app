class NotificationsController < ApplicationController
    respond_to :js, :json, :html
    
    def index
        @user = current_user
        @notifications = Notification.where('user_id = ?', @user.id).order('created_at DESC')
    end
    
    def destroy
        @notification = Notification.find(params[:id])
        @notification.destroy!
        
        respond_to do |format|
            format.html { redirect_to :back }
            format.js
        end
    end
    
    def new
        @user = User.find(params[:id])
        respond_to do |format|
            format.html { render 'shared/new_notification' }
            format.js
        end
    end
    
    def create
        @user = User.find(params[:id])
        
        @notification_params = {action: "admin", post: "", action_id: 0, user_id: @user.id, post_id: 0, message: params[:notification][:message]}
        @notification = Notification.create!(@notification_params)
        
        respond_to do |format|
            format.html { redirect_to :back }
            format.js
        end
    end    
    
    def export
        @notifications = Notification.all
      
        csv_string_visions = CSV.generate do |csv|
           csv << ["User Id", "Type", "Vision Post ID", "Goal Post ID", "Message", "Date"]
           @notifications.each do |notification|
             csv << [notification.user_id, notification.action, notification.post_id, notification.tagged_post_id, notification.message, notification.created_at]
           end
        end         
        
        send_data csv_string_visions,
        :type => 'text/csv; charset=iso-8859-1; header=present',
        :disposition => "attachment; filename=notifications.csv" 
    end
    
end    