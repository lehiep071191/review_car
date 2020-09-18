class ReportsController < ApplicationController
	before_action :logged_in_user
	def new
		@report = Report.new
		@post = Post.find_by(id: params[:post_id])
	end	
	def create
		@post = Post.find_by(id: params[:post_id]) 
		@report = @post.reports.build(report_params)
		@report.user = current_user
		if @report.save!
			flash[:success] = "Your reports have been passed on to the administrator"
			redirect_to @report.post
		else 
			flash[:danger] = "Errors"		
		end		
	end	
	private
	def report_params
		params.require(:report).permit(:content, :post_id, :user_id)
	end	
end
