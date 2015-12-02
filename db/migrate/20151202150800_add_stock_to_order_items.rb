class AddStockToOrderItems < ActiveRecord::Migration
  def change
    add_reference :order_items, :stock, index: true, foreign_key: true
  end
end
