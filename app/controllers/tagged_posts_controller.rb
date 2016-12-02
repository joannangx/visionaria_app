class TaggedPostsController < ApplicationController
    before_filter :authenticate_user!
    respond_to :js, :json, :html
    
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
    
    def export
        @posts = TaggedPost.all
        
        csv_string_goals = CSV.generate do |csv|
           csv << ["User Id", "Content", "Category", "Goal", "Date", "Public"]
           @posts.each do |post|
             csv << [post.user_id, post.content, post.category, post.tag, post.created_at, post.public]
           end
        end         
        
        send_data csv_string_goals,
        :type => 'text/csv; charset=iso-8859-1; header=present',
        :disposition => "attachment; filename=goals.csv" 
    end


    def new
        @all_categories = TaggedPost.all_categories
        @all_un_goals = TaggedPost.all_un_goals
    end    

    def create
        @user = current_user
        @post = @user.tagged_posts.create!(tagged_post_params)
        @point = Point.where('variety = ? AND user_id = ?', @post.tag, current_user.id).first
        @point.determine_op_and_update('add')

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
        @point = Point.where('variety = ? AND user_id = ?', @post.tag, current_user.id).first
        @point.determine_op_and_update('sub')
        
        redirect_to tagged_posts_path
    end
    
    def like
        if params[:id]!=nil
            @post = TaggedPost.find(params[:id])
        
            @like = @post.likes.create
            current_user.likes << @like
            @post.save
        end
        
        if request.xhr?
            render json: { count: @post.likes.count, id: params[:id] }
        else
            redirect_to tagged_posts_path
        end
    end
    
    def dislike
        if params[:id]!=nil
            @post = TaggedPost.find(params[:id])
        
            @like = Like.find_by(:tagged_post_id => @post.id, :user_id => current_user.id)
            @like.destroy
            @post.save
        end
    
        if request.xhr?
            render json: { count: @post.likes.count, id: params[:id] }
        else
            redirect_to tagged_posts_path
        end
    end
    
    
    def help
        if params[:id]!=nil
            @post = TaggedPost.find(params[:id])
        
            @help = @post.helps.create(@post_id)
            current_user.helps << @help
            @post.save
        end
        
        if request.xhr?
            render json: { count: @post.helps.count, id: params[:id] }
        else
            redirect_to tagged_posts_path
        end
    end
    
    def unhelp
        if params[:id]!=nil
            @post = TaggedPost.find(params[:id])
        
            @help = Help.find_by(:tagged_post_id => @post.id, :user_id => current_user.id)
            @help.destroy
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
        
            @inspire = @post.inspires.create(@post_id)
            current_user.inspires << @inspire
            @post.save
        end
        
        if request.xhr?
            render json: { count: @post.inspires.count, id: params[:id] }
        else
            redirect_to tagged_posts_path
        end
    end
    
    def uninspire
        if params[:id]!=nil
            @post = TaggedPost.find(params[:id])
        
            @inspire = Inspire.find_by(:tagged_post_id => @post.id, :user_id => current_user.id)
            @inspire.destroy
            @post.save
        end
        
        if request.xhr?
            render json: { count: @post.inspires.count, id: params[:id] }
        else
            redirect_to tagged_posts_path
        end
    end
    
end
