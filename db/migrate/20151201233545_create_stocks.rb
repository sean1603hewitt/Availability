class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :availability
      t.integer :recommended_level
      t.integer :standard_order
      t.string :supplier_name
      t.string :supplier_email

      t.timestamps null: false
    end
  end
end
