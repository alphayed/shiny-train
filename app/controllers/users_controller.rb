class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_user

  def show
    @order = Order.new
    @cars = @user.cars.all.order("created_at")
    @user = current_user
    @car = Car.find_by_id(params[:id])
  end

  # def orders
  #   @user = current_user
  #   unless @car = Car.find_by_id(params[:id] )
  #   redirect_to user_cars_path
  #   end
  #   @order = Order.current_user.cars.build(order_params)
  # end

  private
    def order_params
      params.require(:order).permit(:service_type, :user_car, :extra_service)
    end

end
