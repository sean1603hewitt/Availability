class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :stock
 
  
  def total_price
    self.quantity * self.product.price
  end
end
