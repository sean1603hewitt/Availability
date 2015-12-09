class OrderForm
  include ActiveModel::Model
  
  attr_accessor :user, :order
  attr_writer :cart
  
  def save
	@order = Order.create! user: user
	
	build_order_items

  end
  
  def has_errors?
    user.errors.any?
  end
  
  private
  
  def valid?
    user.valid?
  end
  
  
  def build_order_items
    @cart.items.each do |item|
     @order.order_items.create! product_id: item.product_id, quantity: item.quantity
	end
  end
  

end