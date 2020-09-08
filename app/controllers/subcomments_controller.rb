class SubcommentsController < ApplicationController
	before_action :logged_in_user, only: [:create]
	before_action :find_subcomment, only: [:edit, :update, :destroy, :correct_user]
	before_action :correct_user, only: [:edit, :update]
	
	def new
		@subcomment= Subcomment.new
		@comment = Comment.find_by id: params[:comment_id]
	end

	def create

		@comment = Comment.find_by id: params[:comment_id]
		@subcomment = @comment.subcomments.build(subcomment_params)
		@subcomment.user = current_user
		if @subcomment.save!
			flash[:success] = "SubComment created!"
			redirect_to @comment.post
    	end
    end	

    def edit
    	@subcomment = Subcomment.find_by(id: params[:comment_id])
    end

    def update

    	@subcomment = Subcomment.find_by(id: params[:comment_id])
    	if @subcomment.update(subcomment_params)
			flash[:success] = "Update successful"
   		end
   		redirect_to @subcomment.comment.post
   	end

   	def destroy
   		@subcomment = Subcomment.find_by(id: params[:comment_id])
   		@subcomment.destroy
   		redirect_to @subcomment.comment.post
   	end

    private

    def subcomment_params
		  params.require(:subcomment).permit(:content, :comment_id, :user_id)
	  end

    def correct_user
        @user = @subcomment.user
        redirect_to(root_url) unless current_user.current_user?(@user)
    end

    def find_subcomment
    	 @subcomment = Subcomment.find_by(id: params[:comment_id])
      	if @subcomment.nil?
           flash[:error] = "Without any comments!"
           redirect_to root_url
        end

    end
end
