class PostsController < ApplicationController
	 before_action :find_post, only: [:show, :edit, :update, :destroy] 
   before_action :logged_in_user, only: [:new, :edit, :update, :destroy]


  def index
    @posts = Post.all
    @likes = hienthipost.take(4)
  end  
  def new
    @post = Post.new
  end  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post Created!"
      redirect_to root_url
    else
      
      render :new
    end
  end
  def show
    @comment = @post.comments.build
    @comments = @post.comments.order_by_time.paginate(page: params[:page])
    if logged_in?
     @follow = current_user.follows.find_by post_id: @post.id
     @follows = @post.follows
    end

  end 

  def edit
   
  end
  
  def update
    if @post.update(post_params)
      flash[:success] = "updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "post deleted"
    redirect_to request.referrer || root_url
  end

  private
  def post_params
    params.require(:post).permit(:content, :image, :title, :name, :video, :brand)
  end

  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  end

  def find_post
      @post = Post.find_by id:params[:id] 
      if  @post.nil?
        flash[:danger] = "post not found"
        redirect_to root_path
      end
   end 
end


