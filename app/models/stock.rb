class Stock < ActiveRecord::Base
  belongs_to :product
  has_one :order_item
  belongs_to :order
end
