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
        @post = @user.tagged_posts.create!(tagged_post_params)

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
    
    def help
        if params[:id]!=nil
            @post = TaggedPost.find(params[:id])
        
            if current_user.helped?(@post)
               @help = Help.find_by(:tagged_post_id => @post.id, :user_id => current_user.id)
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
            redirect_to tagged_posts_path
        end
    end
    
    
    def inspire
        if params[:id]!=nil
            @post = TaggedPost.find(params[:id])
        
            if current_user.inspired?(@post)
               @inspire = Inspire.find_by(:tagged_post_id => @post.id, :user_id => current_user.id)
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
            redirect_to tagged_posts_path
        end
    end
    
    
end
