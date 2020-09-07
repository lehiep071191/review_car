class RegistratedsController < ApplicationController


	def index
		@registrateds = Registrated.all
	end	
	
	def show
		@registrated = Registrated.find_by id: params[:id]
		@registration = @registrated.registrations.build
		@registrations = @registrated.registrations
	end 

	private 
	def registrated_params
		params.require(:registrated).permit(:title, :place,:time_registrated, car_ids: [])
	end	
end

