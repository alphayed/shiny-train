class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_user
  before_action :find_user
  after_action :find_car

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.build(order_params)

    if @order.save
      service_type = params[:order][:service_type]
      extra_service = params[:order][:extra_service]
      description = params[:order][:description]

      OrderMailer.order_email(@order, service_type, extra_service, description, current_user).deliver_now
      flash[:success] = " Request Sent, Thank You"
      redirect_to new_user_order_path
    elsif
      unless current_user.profile
        flash[:danger] = " Request Failed, Please Add Your Account Information"
        redirect_to new_user_order_path
      end

    elsif
      unless current_user.car
        flash[:danger] = " Request Failed, Please Add A Car To Your Account"
        redirect_to new_user_order_path
      end

    else
      flash[:danger] = " Please Select A Car To Your Account"
      redirect_to new_user_order_path
    end
  end

  def show

  end

  private
  def order_params
    params.require(:order).permit(:user_id, :car_id, :service_type, :user_car, :extra_service)
  end

  # This function allows access to the car model attributes for use in mailer
  def find_car
    @car = Order.all
  end

end
