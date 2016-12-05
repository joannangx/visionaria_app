class CommentsController < ApplicationController
    before_filter :authenticate_user!
    
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create!(comment_params)
        @anonymous = params[:anonymous]
        if @anonymous
            @comment.username = "Anonymous"
        else
            @comment.username = current_user.username
        end
        @comment.save
        if current_user.id != @post.user_id
            @notification_params = {action: "comment", post: "post", action_id: @comment.id, user_id: @post.user_id, post_id: @post.id}
            @notification = Notification.create!(@notification_params)
        end
        redirect_to posts_path
    end
    
    def index
        @post = Post.find(params[:post_id])
        @comments = @post.comments.order('created_at DESC')
    end
    
    def destroy
    
    end
    

    private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
