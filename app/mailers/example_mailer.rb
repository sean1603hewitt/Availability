class ExampleMailer < ApplicationMailer
  default from: "examplefurniture@gmail.com"
  
  def stockOrder_email(stock, product)
    @stock = stock
	@product= product
	mail(to: @supplier_email, subject: 'Stock Order')
  end
end
