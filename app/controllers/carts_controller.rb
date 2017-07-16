class CartsController < ApplicationController

  def index
    @order_items = current_order.order_items
    service = BookstoreService.new
    @products = service.cart_product_call
    @product = service.show_product_call(params['id'])
  end

  def show
    @order_items = current_order.order_items
    service = BookstoreService.new
    @product = service.show_product_call(params['id'])
  end

end
