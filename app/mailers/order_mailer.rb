class OrderMailer < ActionMailer::Base
  default from: "examplefurniture@gmail.com"
  
  def order_confirmation order
    @order = order
	@user = order.user
    mail to: order.user.email, subject: "Your order (##{order.id})"
  end
end