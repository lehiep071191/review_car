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
    respond_to do |format|
      if @car.save
        format.js
        format.html { redirect_to @cars, noitice: 'Car was created' }
        format.json {render :show, status: :created, localtion: @car}
      else
        format.js
        format.html { render :new, noitice: 'shared/errors_messages'}
      end  
    end  
  end	

  def edit
  	@car = Car.find_by id:params[:id]

  end
  def update
     respond_to do |format|
      if @car.update(car_params)
        format.js
        format.html { redirect_to admin_cars_path(@car), noitice: 'Car was updated' }
        format.json {render :show, status: :update, localtion: @car}
      else
        format.js
        format.html { render :edit, noitice: 'shared/errors_messages'}
      end  
  end    
  	# if @car.update(car_params)
   #    flash[:success] = "updated"
   #    redirect_to admin_cars_path(@car)
   #  else
   #    render 'edit'
   #  end	
  end

  def destroy
    	respond_to do |format|
        @car.destroy
        format.html { redirect_to admin_cars_path(@car) }
        format.js
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