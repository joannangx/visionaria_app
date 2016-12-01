class TaggedcommentsController < ApplicationController
    before_filter :authenticate_user!
    
    def create
        @taggedpost = TaggedPost.find(params[:tagged_post_id])
        @taggedcomment = @taggedpost.taggedcomments.create!(comment_params)
        @anonymous = params[:anonymous]
        if @anonymous
            @taggedcomment.username = "Anonymous"
        else
            @taggedcomment.username = current_user.username
        end
        @taggedcomment.save
        redirect_to tagged_posts_path
    end
    
    def index
        @taggedpost = TaggedPost.find(params[:tagged_post_id])
        @taggedcomments = @taggedpost.taggedcomments.order('created_at DESC')
    end
    
    def destroy
    
    end
    

    private
    def comment_params
      params.require(:taggedcomment).permit(:body)
    end
end
