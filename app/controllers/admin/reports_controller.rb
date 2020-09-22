class Admin::ReportsController < ApplicationController
	before_action :require_admin
	def index
		@reports = Report.all
	end	
	def destroy	
		@report = Report.find_by(id: params[:id])
		@report.destroy!
		respond_to do |format|
			format.js
			format.html{ redirect_to admin_reports_path }	
		end
	end	

	private
	def report_params
		params.require(:report).premit(:content, :user_id, :post_id)
	end	
	def require_admin
	    unless current_user.admin?
	      redirect_to root_path
    end
  end
end	