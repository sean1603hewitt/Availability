class Stock < ActiveRecord::Base
  belongs_to :product
  has_many :products
  
end
