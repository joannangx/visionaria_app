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
        
        if request.xhr?
            render json: { count: @post.likes.count, id: params[:id] }
        else
            redirect_to posts_path
        end
    end
    
    def help
        if params[:id]!=nil
            @post = Post.find(params[:id])
        
            if current_user.helped?(@post)
               @help = Help.find_by(:post_id => @post.id, :user_id => current_user.id)
               @help.destroy
               flash[:notice] = "That post doesn't help!"
            else
                @help = @post.helps.create(@post_id)
                current_user.helps << @help
                flash[:notice] = "That post helps!"
            end
            @post.save
        end
        
        if request.xhr?
            render json: { count: @post.helps.count, id: params[:id] }
        else
            redirect_to posts_path
        end
    end
    
    def inspire
        if params[:id]!=nil
            @post = Post.find(params[:id])
        
            if current_user.inspired?(@post)
               @inspire = Inspire.find_by(:post_id => @post.id, :user_id => current_user.id)
               @inspire.destroy
               flash[:notice] = "That post doesn't inspire you!"
            else
                @inspire = @post.inspires.create(@post_id)
                current_user.inspires << @inspire
                flash[:notice] = "That post inspires you!"
            end
            @post.save
        end
        
        if request.xhr?
            render json: { count: @post.inspires.count, id: params[:id] }
        else
            redirect_to posts_path
        end
    end
    
end