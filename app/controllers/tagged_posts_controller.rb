class TaggedPostsController < ApplicationController
    before_filter :authenticate_user!

    def tagged_post_params
        params.require(:tagged_post).permit(:user_id, :content, :tag, :category, :public)
    end 

    def index
        @taggedposts = TaggedPost.where('public = ? OR user_id = ?', true, current_user.id).order('created_at DESC')
        if params[:sort_tag] 
            @taggedposts = @taggedposts.where('tag = ?', params[:sort_tag]).order('created_at DESC')
        end
        if params[:sort_category]
            @taggedposts = @taggedposts.where('category = ?', params[:sort_category]).order('created_at DESC')
        end
    end

    def new
        @all_categories = TaggedPost.all_categories
        @all_un_goals = TaggedPost.all_un_goals
    end    

    def create
        @user = current_user
        @tagged = @user.tagged_posts.create!(tagged_post_params)

        flash[:notice] = "Post successfully saved!"
        redirect_to tagged_posts_path
    end
    
    def edit
        @post = TaggedPost.find(params[:id])
    end
    
    def update
        @post = TaggedPost.find(params[:id])
        @post.update(tagged_post_params)
            
        flash[:notice] = "Tagged post successfully edited!"
        redirect_to tagged_posts_path
    end
    
    def destroy
        @post = TaggedPost.find(params[:id])
        @comments = @post.taggedcomments
        @comments.each do |comment|
           comment.destroy! 
        end
        @likes = @post.likes
        @likes.each do |like|
           like.destroy! 
        end
        @post.destroy!
        flash[:notice] = "Tagged post successfully deleted!"
        redirect_to tagged_posts_path
    end
    
    def like
        if params[:id]!=nil
            @post = TaggedPost.find(params[:id])
        
            if current_user.liked?(@post)
               @like = Like.find_by(:tagged_post_id => @post.id, :user_id => current_user.id)
               @like.destroy
               flash[:notice] = "You unliked the post!"
            else
                @like = @post.likes.create
                current_user.likes << @like
                flash[:notice] = "You liked the post!"
            end
            @post.save
        end
        redirect_to tagged_posts_path
    end
end
