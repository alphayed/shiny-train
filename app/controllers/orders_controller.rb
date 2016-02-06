class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_user

  # def new
  #   @user = User.find( params[:user_id] )
  #   @order = Order.new
  # end
  def show
  end

  def new
    @profile = Profile
    @order = Order.new
    @cars = Car.all.order("created_at")
    @user = current_user
    @car = Car.find_by_id(params[:id])
  end

  def create
    @user = current_user
    # unless @car = Car.find_by_id(params[:id] )
    # redirect_to user_cars_path
    # end
    @order = current_user.orders.build(order_params)
    if @order.save
      flash[:success] = "Request sent"
      redirect_to new_user_order_path
    end
  end

  private
    def order_params
      params.require(:order).permit(:service_type, :user_car, :extra_service)
    end
end
