class OrdersController < ApplicationController
  before_filter :initialize_cart
  
  def index
    @orders = Order.order(created_at: :desc).all
  end
  
  def create
    @order_form = OrderForm.new(
	  user: User.new(order_params[:user]),
	  cart: @cart)
	
	if @order_form.save
	  notify_user
	  redirect_to root_path, notice: "Thank you for ordering these products from us"
	else
	  render "carts/checkout"
	end
  end
  
  private
  
  def notify_user
	OrderMailer.order_confirmation(@order_form.order).deliver
  end
  
  def order_params
    params.require(:order_form).permit(
	  user: [ :name, :email, :address, :postal_code, :city, :country, :phone ]
	)
  end
end