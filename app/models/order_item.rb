class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :order
 
  
  def total_price
    self.quantity * self.product.price
  end
end
