class ProfilesController < ApplicationController
    respond_to :html, :xml, :json
    
    def profile_params
       params.require(:profile).permit(:info, :motivations, :priorities) 
    end    
    
    def show
        @viewed_user = User.find(params[:id])
        @profile = @viewed_user.profile
        @owned = @profile == current_user.profile
        
        if @owned == false
            @profile.info == "Click on text to edit user info." ? @info = " " : @info = @profile.info
            @profile.motivations == "Click on text to edit user motivations." ? @motivations = " " : @motivations = @profile.motivations
            @profile.priorities == "Click on text to edit user priorities." ? @priorities = " " : @priorities = @profile.priorities
        end
        @posts = @viewed_user.public_posts
        @tagged = @viewed_user.public_tagged_posts
        @points_sys = Point.where('user_id = ?', @viewed_user.id).order('amount DESC')
        
    end    
    
    def update
        @profile = current_user.profile
        @profile.update(profile_params)
        @profile.check_params
        @profile.save!

        respond_with @profile
    end

end
