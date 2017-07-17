class CategoriesController < ApplicationController

  def index
    service = BookstoreService.new
    @categories = service.index_category_call
    @products = service.index_product_call(params)
    @order_item = current_order.order_items.new
  end

  def show
    service = BookstoreService.new
    @category = service.show_category_call(params['id'])
    @categories = service.index_category_call
    @products = service.index_product_call(params)
    @order_item = current_order.order_items.new
  end

end
