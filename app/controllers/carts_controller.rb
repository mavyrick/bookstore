class CartsController < ApplicationController

  def index
    @products = service.get_products
    @product = service.get_product(params[:product_id])
    @order_items = current_order.order_items
  end

end
