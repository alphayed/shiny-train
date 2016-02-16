class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_user
  before_action :find_user
  after_action :find_car

  def new
    @cars = Car.all.order("created_at")     # .order does not refere to the variable/object order
    @order = Order.new
  end

  def create
    @order = current_user.orders.build(order_params)

    if @order.save
      service_type = params[:order][:service_type]
      user_car = params[:order][:user_car]
      extra_service = params[:order][:extra_service]

      OrderMailer.order_email(@order, service_type, user_car, extra_service, current_user).deliver_now
      flash.now[:success] = "Request sent"
      redirect_to new_user_order_path
    end
  end

  def show

  end

  private
  def order_params
    params.require(:order).permit(:user_id, :car_id, :service_type, :user_car, :extra_service)
  end

  def find_car
     @car = Order.all
  end

end
