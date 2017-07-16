class ProductsController < ApplicationController

  def index
    service = BookstoreService.new
    @products = service.index_product_call(params)
    @categories = service.index_category_call
    @order_item = current_order.order_items.new
  end

  def show
    service = BookstoreService.new
    @product = service.show_product_call(params['id'])
    @order_item = current_order.order_items.new
    @categories = service.index_category_call
  end

end
