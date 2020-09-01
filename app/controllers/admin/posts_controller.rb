class Admin::PostsController < ApplicationController
  before_action :require_admin, only: :destroy
  # before_action :logged_in_user, only: [:create, :destroy]
  before_action :find_post, only: [:show] 


  def index
    @posts = Post.all
  end  
  def new
    @post = Post.new
  end  
  def create
   
    @post = current_user.posts.build(post_params)
    @post.image.attach(params[:post][:image])

    if @post.save
      flash[:success] = "post created!"
      redirect_to admin_post_path(@post)
    else
      @posts = Post.all.paginate(page: params[:page])
      render 'new'
    end
  end
  def show
  end 

  def destroy
    @post.destroy
    flash[:success] = "post deleted"
    redirect_to request.referrer || root_url
  end

  private
  def post_params
    params.require(:post).permit(:content, :image, :title)
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


  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
