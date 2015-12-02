class Cart
  attr_reader :items
  
  #so the session data persists all of the data in the cart
  #circling each item from the cart's item hash and creating a new mapping for that
  def self.build_from_hash hash
  #check if there is a cart item inside the hash, this hash represents the session
    items = if hash["cart"] then 
	  hash["cart"]["items"].map do |item_data|
	  CartItem.new item_data["product_id"], item_data["quantity"]
	  end
	else
	  []
	end
	
	new items
  end
  #initializing the cart, items defaults to an empty array
  def initialize items = []
    @items = items
  end
  #adding individual products to the cart
  def add_item product_id
  #retrieve items there with this product id
    item = @items.find { |item| item.product_id == product_id }
  # is there is already an item there increment otherwise add a new item
	if item
	  item.increment
	else
	  @items << CartItem.new(product_id)
	end
  end
  
  def empty?
    @items.empty?
  end
  #number of items in the cart
  def count
    @items.inject(0) { |sum, item| sum + item.quantity }
  end
  # to build a list of items in an array
  #serialize contents of entire cart into a hash
  def serialize
  #take an item which will be used to create a brand new hash which will contain
  #two strings product_id and quantity
    items = @items.map do |item|
	  {
	    "product_id" => item.product_id,
		"quantity" => item.quantity
	  }
	end
	#hash being returned from building block above 
    {
	  "items" =>  items
	}
  end
  #calculating the total price of items
  def total_price
    @items.inject(0) { |sum, item| sum + item.total_price }
  end
end