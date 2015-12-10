class RemoveProductFromStocks < ActiveRecord::Migration
  def change
    remove_reference :stocks, :product, index: true, foreign_key: true
  end
end
