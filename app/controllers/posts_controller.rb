class PostsController < ApplicationController
	 before_action :find_post, only: [:show, :edit, :update, :destroy] 
   before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
   # before_action :hastags, :list_hastags, only: [:new, :edit]


  def index
    @posts = Post.all
    @likes = hienthipost.take(4)
  end  
  def new
    @post = Post.new
    @post.hastags.new  
  end  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post Created!"
      redirect_to root_url
    else
      @post.hastags || @post.hastags.new
      render :new
    end
  end
  def show
    @hastag = @post.hastags
    @comment = @post.comments.build
    @comments = @post.comments.order_by_time.paginate(page: params[:page])
    if logged_in?
      @follow = current_user.follows.find_by post_id: @post.id
      @follows = @post.follows
      @report = current_user.reports.find_by post_id: @post.id
      @reports = @post.reports
      @rating = current_user.ratings.find_by post_id: @post.id
      @ratings = @post.ratings
    end

  end 

  def edit
    @post.hastags
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
    # params.require(:post).permit(:content, :image, :title, :name, :video, :brand,  hastags_atttributes: Hastag.attribute_names.map(&:to_sym).push(:_destroy))
    params.require(:post).permit(:content, :image, :title, :name, :video, :brand,  hastags_attributes: [:id, :_destroy, :post_id, :content])
  end
  # def list_hastags
  #   @hastags = Hastag.all.select(:id, :content).map{|hastag| [hastag.content, hastag.id]}
  # end

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


