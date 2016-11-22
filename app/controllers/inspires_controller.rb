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
    end
    
    def destroy
        self.destroy
    end
end
