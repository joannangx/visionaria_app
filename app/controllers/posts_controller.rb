class PostsController < ApplicationController
    before_filter :authenticate_user!
    
    def post_params
        params.require(:post).permit(:user_id, :content, :public)
    end    
    
    def index
        @user = current_user
        if @user.profile.nil?
            @profile = Profile.create({:user_id => @user.id})
            @user.profile = @profile
        end
        
        @posts = Post.where('public = ? OR user_id = ?', true, current_user.id).order('created_at DESC')
    end
    
    def create
        @user = current_user
        #Whenever the user makes a post, he/should earn one point for creating that point
        @user.point = @user.point + 1
        #If we divide 5 points into every level
        @user.level = @user.point / 5
        @user.save
        
        @post = @user.posts.create!(post_params)

        flash[:notice] = "Post successfully saved!"
        
        redirect_to posts_path
        
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
            
        flash[:notice] = "Post successfully edited!"
        redirect_to posts_path
    end
    
    def destroy
        @post = Post.find(params[:id])
        @comments = @post.comments
        @comments.each do |comment|
           comment.destroy! 
        end
        @likes = @post.likes
        @likes.each do |like|
           like.destroy! 
        end
        @post.destroy!
        flash[:notice] = "Post successfully deleted!"
        redirect_to posts_path
    end
    
    def like
        if params[:id]!=nil
            @post = Post.find(params[:id])
        
            if current_user.liked?(@post)
               @like = Like.find_by(:post_id => @post.id, :user_id => current_user.id)
               @like.destroy
               flash[:notice] = "You unliked the post!"
            else
                @like = @post.likes.create(@post_id)
                current_user.likes << @like
                flash[:notice] = "You liked the post!"
            end
            @post.save
        end
        redirect_to posts_path
    end
    
end