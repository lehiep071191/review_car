class Admin::RegistrationsController < ApplicationController
	def destroy
	 	@registration = Registration.find_by id: params[:id]
	 	respond_to do |format|
	 		@registration.destroy
			format.html { redirect_to admin_registrated_path(@registrated) }
			format.js
		end
	end	
end	
