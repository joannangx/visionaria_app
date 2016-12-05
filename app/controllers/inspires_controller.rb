class InspiresController < ApplicationController
    before_filter :authenticate_user!
    
    def create
        if params[:name] == 'post'
            @post = Post.find(params[:id])
            @inspire.post_id = @post.id
            @inspire.tagged_post_id = 0
        else
            @post = TaggedPost.find(params[:id])
            @inspire.tagged_post_id = @post.id
            @inspire.post_id = 0
        end
        @inspire.user_id = current_user.id
        @inspire.save!
        if @inspire.user_id != @post.user_id
            @notification_params = {action: "inspire", post: params[:name], action_id: @inspire.id, user_id: @post.user_id, post_id: @post.id}
            @notification = Notification.create!(@notification_params)
        end
    end
    
    def destroy
        self.destroy
    end
end
