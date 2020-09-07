class Admin::RegistratedsController < ApplicationController
  before_action :require_admin
  before_action :find_registrated, only: [:show, :edit, :update, :destroy]
  def index
  	@registrateds = Registrated.all
  end	
  def new
  	@registrated = Registrated.new
  end
  def create
    registrated_params[:car_ids].reject!{|a| a==""}
  	@registrated = Registrated.new(registrated_params)
    if @registrated.save
      flash[:success] = "Registrated created!"
      redirect_to admin_registrateds_path
    else
      render 'new'
    end  
  end	
  def show
    @registrations = @registrated.registrations
  end	
  def edit
  end
  def update
  	if @registrated.update(registrated_params)
      flash[:success] = "updated"
      redirect_to admin_registrateds_path(@registrated)
    else
      render 'edit'
    end	
  end
  def destroy
    @registrated.destroy

    flash[:success] = "Registrated deleted!"

    redirect_to request.referrer || root_url
  end	


	private
	def registrated_params
 		params.require(:registrated).permit(:title, :place,:time_registrated, car_ids: [])
	end	
	def require_admin
		unless current_user.admin?
			redirect_to root_path
		end
	end

  def find_registrated
    @registrated = Registrated.find_by id:params[:id] 
        redirect_to root_path unless @registrated
  end 
end	