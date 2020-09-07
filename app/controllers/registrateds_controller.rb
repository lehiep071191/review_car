class RegistratedsController < ApplicationController
	before_action :find_registrated, only: :show

	def index
		@registrateds = Registrated.all
	end	
	
	def show
		
		@registration = @registrated.registrations.build
		@registrations = @registrated.registrations
	end 

	private 
	def registrated_params
		params.require(:registrated).permit(:title, :place,:time_registrated, car_ids: [])
	end	
	def find_registrated
		@registrated = Registrated.find_by id: params[:id]
		if @registrated.nil?
			flash[:danger] = "registrated not found"
			redirect_to root_path
		end
				
	end	
end

