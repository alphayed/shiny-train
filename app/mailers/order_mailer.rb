class OrderMailer < ActionMailer::Base
  default to: 'ahmedm.fayed@gmail.com'

  def order_email(order, service_type, user_car, extra_service, user)
    # Order info
    @service_type = service_type
    @user_car = user_car
    @extra_service = extra_service

    # User info
    @customer_id = user.id
    @first_name = user.profile.first_name
    @last_name = user.profile.last_name
    @customer_email = user.profile.contact_email
    @customer_phone = user.profile.phone_number
    @customer_address = user.profile.address
    @customer_city = user.profile.city
    @customer_postal_code = user.profile.postal_code

    # Car info
    @car_type = order.car.make
    mail(from: user.profile.contact_email, subject: "#{@service_type} Request")
  end
end
