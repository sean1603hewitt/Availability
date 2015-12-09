class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :find_categories
  #using application controller to store cart
  # session variable always exists in each controller
  def initialize_cart
    @cart = Cart.build_from_hash session
  end
  
  def find_categories
    @categories = Category.all
  end
  
  def authenticate_admin!
    authenticate_user!
	
	unless current_user.admin!
	  redirect_to root_path, alert: "You are not allowed to perform that operation."
	end
  end
end