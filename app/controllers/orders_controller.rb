class OrdersController < ApplicationController
  before_filter :initialize_cart
  
  def index
    @orders = Order.order(created_at: :desc).all
	@user = User.find(order_params[:user])
  end
  
  def create
    
	  @order = Order.new
	  @user = User.new(order_params[:user])
	  @user.save
	  @order.user = @user
	  
	 
	  @cart.items.each do |item|
	    @order_item = OrderItem.new
	    @order_item.product = item.product
	    @order_item.quantity = item.quantity
	    @order_item.order = @order
	    @order_item.save
	    
	    product = Product.find(item.product)
			
			stock_id = product.stock.id
			stock = Stock.find(stock_id)
	    stock.availability = stock.availability - item.quantity
	    stock.save
	    
	  end
	
	if @order.save
	  @user.save
      #check_stock
	  #notify_user
	  session[:cart] = nil
	  redirect_to root_path, notice: "Thank you for ordering these products from us"
	else
	  render "carts/checkout"
	end
  end
  
  def check_stock 
    product = Product.all
	stock = Stock.all
	
	@stocks.each do |stock|
      if stock.availability <= stock.recommended_level
        ExampleMailer.stockOrder_email(@stock).deliver
      else
      end
	end
  end
  
  private
  
  def notify_user
  	OrderMailer.order_confirmation(@order_form.order).deliver
  end
  
  def order_params
    params.permit(
	  user: [ :name, :email, :address, :postal_code, :city, :country, :phone ]
	)
  end
end