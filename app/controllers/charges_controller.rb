class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    product_json = RestClient.get 'http://localhost:2000/products.json/'
    @amount = JSON.parse(product_json).first['price']

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
