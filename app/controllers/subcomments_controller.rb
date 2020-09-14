class SubcommentsController < ApplicationController
	before_action :logged_in_user, only: [:create]
	before_action :find_subcomment, only: [:edit, :update, :destroy, :correct_user]
	before_action :correct_user, only: [:edit, :update]
	after_action :subcomment_ajax, only: [:new, :create, :edit, :update, :destroy]
	def new
		@subcomment= Subcomment.new
		@comment = Comment.find_by id: params[:comment_id]
	end

	def create
		@comment = Comment.find_by id: params[:comment_id]
		@subcomment = @comment.subcomments.build(subcomment_params)
		@subcomment.user = current_user
		if @subcomment.save!
      respond_to do |format|
        format.html { redirect_to @comment}
        format.js
      end  
    end	
  end  

    def edit
    end

    def update
      if @subcomment.update(subcomment_params)
        flash[:success] = "Updated comment."
      end
   	end

   	def destroy
   		@subcomment.destroy
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
    	 @subcomment = Subcomment.find_by(id: params[:id])
      	if @subcomment.nil?
           flash[:error] = "Without any comments!"
           redirect_to @post
        end
    end

    def subcomment_ajax
      respond_to do |format|
        format.html { redirect_to @subcomment.comment.post}
        format.js
      end
    end
end
