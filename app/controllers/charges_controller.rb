class ChargesController < ApplicationController

  before_action :authenticate_user!

  def new
    service = BookstoreService.new
    @product = service.show_product_call(params['id'])
    @product_id = params['id']
  end

  def create
    # Amount in cents

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
