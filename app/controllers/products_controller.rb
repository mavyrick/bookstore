class ProductsController < ApplicationController

  def index
    @products = kaminari(service.get_products)
    @categories = service.get_categories
    @order_item = current_order.order_items.new
  end

  def show
    @product = service.get_product(params[:id])
    @categories = service.get_categories
    @order_item = current_order.order_items.new
  end

end
