class RegistrationsController < ApplicationController

	before_action :logged_in_user, only: [:create]
	before_action :find_car_registed, only: :create
	before_action :find_registration, only: [:show, :edit, :update, :destroy, :correct_user]
	before_action :correct_user, only: [:edit, :update]

	
	def create
		@registration = @car_registrated.registrations.build(registration_params)
		@registration.user = current_user
		if @registration.save
			flash[:success] = "registration create"
			redirect_to root_url
		else 
			flash[:danger] = "errors"
			redirect_to root_url	
		end	
	end

	def show
	end



	private

	def find_registration
		@registration = Registration.find_by(id: params[:id])
		if @registration.nil?
			flash[:danger] = "Without any registrations!"
			redirect_to root_url
		end	
	end

	def correct_user
		@user = @registration.user
		redirect_to root_url unless current_user.current_user?(@user)
	end

	def registration_params
		params.require(:registration).permit(:user_id, :fullname, :registrated_id, :phone, :drive_lisence, :car_id)
	end

	def find_car_registed
		@car_registrated = CarRegistrated.find_by car_id: registration_params[:car_id], registrated_id: registration_params[:registrated_id]
	end
end
