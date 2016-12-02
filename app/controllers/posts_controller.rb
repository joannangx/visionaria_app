class PostsController < ApplicationController
    before_filter :authenticate_user!
    respond_to :js, :json, :html
    
    def post_params
        params.require(:post).permit(:user_id, :content, :public)
    end    
    
    def index
        @posts = Post.where('public = ? OR user_id = ?', true, current_user.id).order('created_at DESC')
    end
    
    def export
        @posts = Post.all
      
        csv_string_visions = CSV.generate do |csv|
           csv << ["User Id", "Content", "Date", "Public"]
           @posts.each do |post|
             csv << [post.user_id, post.content, post.created_at, post.public]
           end
        end         
        
        send_data csv_string_visions,
        :type => 'text/csv; charset=iso-8859-1; header=present',
        :disposition => "attachment; filename=visions.csv" 
    end
    
    def create
        @user = current_user
        @post = @user.posts.create!(post_params)
        @point = Point.where('variety = ? AND user_id = ?', 'Visions', current_user.id).first
        @point.determine_op_and_update('add')

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
        @point = Point.where('variety = ? AND user_id = ?', 'Visions', @post.user.id).first
        @point.determine_op_and_update('sub')

        redirect_to posts_path
    end
    
    def like
        if params[:id]!=nil
            @post = Post.find(params[:id])
            
            @like = @post.likes.create(@post_id)
            current_user.likes << @like
            @post.save
        end
        
        if request.xhr?
            render json: { count: @post.likes.count, id: params[:id] }
        else
            redirect_to posts_path
        end
    end
    
    def dislike
        if params[:id]!=nil
            @post = Post.find(params[:id])
            
            @like = Like.find_by(:post_id => @post.id, :user_id => current_user.id)
            @like.destroy
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
        
            @help = @post.helps.create(@post_id)
            current_user.helps << @help
            @post.save
        end
        
        if request.xhr?
            render json: { count: @post.helps.count, id: params[:id] }
        else
            redirect_to posts_path
        end
    end
    
    def unhelp
        if params[:id]!=nil
            @post = Post.find(params[:id])
        
            @help = Help.find_by(:post_id => @post.id, :user_id => current_user.id)
            @help.destroy    
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

            @inspire = @post.inspires.create(@post_id)
            current_user.inspires << @inspire
            @post.save
        end
        
        if request.xhr?
            render json: { count: @post.inspires.count, id: params[:id] }
        else
            redirect_to posts_path
        end
    end
    
    def uninspire
        if params[:id]!=nil
            @post = Post.find(params[:id])
        
            @inspire = Inspire.find_by(:post_id => @post.id, :user_id => current_user.id)
            @inspire.destroy
            @post.save
        end
        
        if request.xhr?
            render json: { count: @post.inspires.count, id: params[:id] }
        else
            redirect_to posts_path
        end
    end    
    
end