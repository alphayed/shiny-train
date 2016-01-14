class CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_user_profile
  def new
    @car = Car.new
  end
  
  def create
    @user = User.find( params[:user_id] )
    @car = @user.build_car(car_params)
  end 
  
  private 
    def car_params
      params.require(:car).permit(:user_id, :type, :make, :model, :contact_email, :color, :year)
    end
end
