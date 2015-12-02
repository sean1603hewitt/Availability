json.array!(@stocks) do |stock|
  json.extract! stock, :id, :availability, :recommended_level, :standard_order, :supplier_name, :supplier_email
  json.url stock_url(stock, format: :json)
end
