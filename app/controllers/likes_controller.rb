class LikesController < ApplicationController
    before_filter :authenticate_user!
    
    def create
        if params[:name] == 'post'
            @post = Post.find(params[:id])
            @like.post_id = @post.id
            @like.tagged_post_id = 0
        else
            @post = TaggedPost.find(params[:id])
            @like.tagged_post_id = @post.id
            @like.post_id = 0
        end
        @like.user_id = current_user.id
        @like.save!
    end
    
    def destroy
        puts "Hello?"
        self.destroy
    end
end
