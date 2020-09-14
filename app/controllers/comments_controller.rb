class CommentsController < ApplicationController
	before_action :logged_in_user, only: [:create]
	before_action :find_comment, only: [:edit, :update, :destroy, :correct_user]
	before_action :correct_user, only: [:edit, :update]
	after_action :comment_ajax, only: [:edit, :update, :destroy]
	def create
		@post = Post.find_by(id: comment_params[:post_id])
		@comment = @post.comments.build(comment_params)
		@comment.user = current_user
		if @comment.save!
			flash[:success] = "Created comment."
			respond_to do |format|
				format.html { redirect_to @post }
				format.js
			end
		end	
	end

	def show
	end

	def edit
	end

	def update
		if @comment.update(comment_params)
			flash[:success] = "Updated comment."
		end
	end

	def destroy
		@comment.destroy
	end

	private

	def find_comment
		@comment = Comment.find_by(id: params[:id])
		if @comment.nil?
			flash[:danger] = "Without any comments!"
			redirect_to root_url
		end	
	end

	def correct_user
		@user = @comment.user
		redirect_to root_url unless current_user.current_user?(@user)
	end

	def comment_params
		params.require(:comment).permit(:content, :post_id, :user_id)
	end

	def comment_ajax
		respond_to do |format|
				format.html { redirect_to @comment.post }
				format.js
			end
	end 
end	