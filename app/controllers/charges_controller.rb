class ChargesController < ApplicationController

  before_action :authenticate_user!

  def new
    @order_items = current_order.order_items
  end

  def create

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => current_order.subtotal * 100,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    reset_session

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charges_path
  end

end
