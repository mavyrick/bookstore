class AddProductPriceToOrderItem < ActiveRecord::Migration
  def change
    add_column :order_items, :product_price, :decimal
  end
end
