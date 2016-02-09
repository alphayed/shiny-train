class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_user

  def new
    @profile = Profile
    @order = Order.new
    @cars = Car.all.order("created_at")
    @user = current_user
    @car = Car.find_by_id(params[:id])
  end

  def create
    # @profile = current_user.profile
    @user = current_user
    @order = current_user.orders.build(order_params)

    if @order.save
      order = current_user.orders(order_params)
      user_email = current_user.profile.contact_email
      service = current_user.orders

      OrderMailer.order_email(order, user_email, service).deliver
      flash.now[:success] = "Request sent"
      redirect_to new_user_order_path
    end
  end

  def show

  end

  private
    def order_params
      params.require(:order).permit(:service_type, :user_car, :extra_service)
    end
end
