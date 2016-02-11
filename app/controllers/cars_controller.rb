class CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_user_profile
  before_action :find_user
  before_action :find_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = @user.cars.all.order("created_at")
  end

  def new
    @car = Car.new
  end

  def create
    @car = current_user.cars.build(car_params)

    if @car.save
      flash[:success] = "Car Added"
      redirect_to user_cars_path
    else
      render "index"
    end
  end

  def destroy
    @car.destroy
    redirect_to user_cars_path
  end

  private
  def car_params
    params.require(:car).permit(:user_id, :car_type, :make, :model, :color, :year, :licence_plate)
  end

  def find_car
    unless @car = Car.find(params[:id] )
      redirect_to user_cars_path
    end
  end

end
