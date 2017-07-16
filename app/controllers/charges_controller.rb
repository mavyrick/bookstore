class ChargesController < ApplicationController

  before_action :authenticate_user!

  def new
    # service = BookstoreService.new
    # @product = service.show_product_call(params['id'])
    # @product_id = params['id']
    @order_items = current_order.order_items
  end

  def create
    # Amount in cents

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => current_order.subtotal ,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_cart_charge_path
  end

end
