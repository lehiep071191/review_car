class RatingsController < ApplicationController
	before_action :logged_in_user, only: [:new, :edit]
	before_action :find_rating, only: [:edit, :update]

	def new
		@rating = Rating.new
		@post = Post.find_by(id: params[:post_id])
	end	
	def create
		@post = Post.find_by(id: params[:post_id])
		@rating = @post.ratings.build(rating_params)
		@rating.user = current_user
		if @rating.save!
			flash[:success] = "Thanks for your rating"
			redirect_to @rating.post
		end		
	end
	def edit
	end
	def update
		if @rating.update(rating_params)
			 redirect_to @rating.post  
      	end
	end

	private 

	def rating_params
		params.require(:rating).permit(:user_id, :post_id, :rate)
	end	
	def find_rating
		@rating = Rating.find_by id: params[:id]
		if @rating.nil?
			flash[:danger] = "rating not found"
			redirect_to root_url
		end	
	end		
end
