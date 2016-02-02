class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_user

  # def new
  #   @user = User.find( params[:user_id] )
  #   @order = Order.new
  # end

  def create
    @user = current_user
    unless @car = Car.find_by_id(params[:id] )
    redirect_to user_cars_path
    end
    @order = Order.current_user.cars.build(order_params)
  end

  private
    def order_params
      params.require(:order).permit(:service_type, :user_car, :extra_service)
    end
end
