class CarsController < ApplicationController
  before_action :find_user
  before_action :find_car, only: [:index, :show, :edit, :update, :destroy]
  
  def index
     @cars = @user.cars.all.order("created_at DESC") 
  end
  
  def show
    
  end
  
  def new
  @car = Car.new
  end
  
  def create
    @car = current_user.cars.build(car_params)
    if @car.save
      flash[:success] = "Info Added"
      redirect_to user_cars_path
    else
      render "new"
    end
  end 
  
  def edit
    
  end
  
  def update
    
  end
  
  private 
    def car_params
      params.require(:car).permit(:car_type, :make, :model, :color, :year)
    end
  
    def find_user
      @user = User.find( params[:user_id] )
    end
    
    def find_car
      @car = Car.find( params[:user_id] )
    end
      
end
