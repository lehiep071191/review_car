class PostsController < ApplicationController
	 before_action :find_post, only: [:show, :edit, :update, :destroy] 
   before_action :logged_in_user, only: [:index, :edit, :update, :destroy]


  def index
    @posts = Post.all
  end  
  def new
    @post = Post.new
  end  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save!
      flash[:success] = "Post Created!"
      redirect_to root_url
    else
      flash[:danger] = "FAIL - Please read message error !"
    end
  end
  def show
    @comment = @post.comments.build
    @comments = @post.comments.order_by_time.paginate(page: params[:page])

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
    params.require(:post).permit(:content, :image, :title, :name, :video)
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
        redirect_to root_path
      end
   end 
end


