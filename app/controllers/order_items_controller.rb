class OrderItemsController < ApplicationController

protect_from_forgery with: :null_session
skip_before_filter :verify_authenticity_token

  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

private

  def order_item_params
    @product = service.get_product(params[:product_id])
    params.require(:order_item).permit(:quantity, :product_name, :product_id, :product_price)
  end
end
