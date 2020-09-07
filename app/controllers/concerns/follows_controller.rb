class FollowsController < ApplicationController
	before_action :find_follow, only: :destroy

	def create
		# // tim bai post muon Follow
		# //tao follow theo bai post vua duoc tim thay 
		# //gan user follow bai post = current_user
		@follow = current_user.follows.build(follow_params)
		@follow.save!
		respond_to do |format|
			format.js	
		 	format.html { redirect_to (@follow.post) }
		end
		# redirect_to post_path(@follow.post)
		# redirect_to post_path(follow_params[:post_id])
		
	end
	def destroy
		byebug
		@follow.destroy!
		# redirect_to post_path(@follow.post)
		respond_to do |format|
			format.js
			format.html { redirect_to (@follow.post) }
		end
	end	

	private 

	def follow_params
		params.require(:follow).permit(:post_id, :user_id)
	end	
	def find_follow
		@follow = Follow.find_by id: params[:id]
	end	

end	
