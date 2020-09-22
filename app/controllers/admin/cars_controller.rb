class Admin::CarsController < ApplicationController
	before_action :require_admin
  before_action :find_car, only: [:show, :edit, :update, :destroy]
  def index
  	@cars = Car.all
  end	
  def new
  	@car = Car.new
  end
  def create
  	@car = Car.new(car_params)
    if @car.save
      flash[:success] = "D"
      redirect_to admin_cars_path
    else
      render 'new'
    end  
  end	

  def edit
  	@car = Car.find_by id:params[:id]

  end
  def update
  	if @car.update(car_params)
      flash[:success] = "updated"
      redirect_to admin_cars_path(@car)
    else
      render 'edit'
    end	
  end
  def destroy
     respond_to do |format|
        @car.destroy
        format.js
        format.html { redirect_to admin_cars_path }
      end	
  end    
  private 
  def car_params	
  	params.require(:car).permit(:name, :color ,:type_car,:brand,:status)
  end	

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def find_car
  	@car = Car.find_by id:params[:id] 
        redirect_to root_path unless @car
  end	

end