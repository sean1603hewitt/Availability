class AddOrderToStocks < ActiveRecord::Migration
  def change
    add_reference :stocks, :order, index: true, foreign_key: true
  end
end
