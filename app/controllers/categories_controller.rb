class CategoriesController < ApplicationController

  def index
    @categories = service.get_categories
    @products = kaminari(service.get_products)
    @order_item = current_order.order_items.new
  end

  def show
    @category = service.get_category(params[:id])
    @categories = service.get_categories
    @products = kaminari(service.get_products)
    @order_item = current_order.order_items.new
  end

end
