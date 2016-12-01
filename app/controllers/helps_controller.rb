class HelpsController < ApplicationController
    before_filter :authenticate_user!
    
    def create
        if params[:name] == 'post'
            @post = Post.find(params[:id])
            @help.post_id = @post.id
            @help.tagged_post_id = 0
        else
            @post = TaggedPost.find(params[:id])
            @help.tagged_post_id = @post.id
            @help.post_id = 0
        end
        @help.user_id = current_user.id
        @help.save!
    end
    
    def destroy
        self.destroy
    end
end
