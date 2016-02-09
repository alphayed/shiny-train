class OrderMailer < ActionMailer::Base
  default to: 'ahmedm.fayed@gmail.com'

  def order_email(order, user_email, service)
    @order = order
    @user_email = user_email
    @service = service

    mail(from: user_email, subject: "#{@service} Request")
  end
end
