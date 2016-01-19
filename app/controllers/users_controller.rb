class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_user
  
  def show
    @cars = @user.cars.all.order("created_at") 
    @user = current_user
    @car = Car.find_by_id(params[:id])
  end
  
end