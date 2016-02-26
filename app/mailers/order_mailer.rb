class OrderMailer < ActionMailer::Base
  default to: 'support@getfixa.com'

  def order_email(order, service_type, extra_service, description, user)
    # Order info
    @order_id = user.order.id
    @service_type = service_type
    @extra_service = extra_service
    @description = description

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
    @car_type = order.car.car_type
    @car_make = order.car.make
    @car_model = order.car.model
    @car_color = order.car.color
    @car_year = order.car.year
    @car_licence = order.car.licence_plate
    mail(from: user.profile.contact_email, subject: "#{@service_type} Request")
  end
end
