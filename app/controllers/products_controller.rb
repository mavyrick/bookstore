class ProductsController < ApplicationController

require "httparty"
require 'json'
require 'rest-client'

  def index
    # products_json = HTTParty.get('http://localhost:2000/products.json/')
    products_json = RestClient.get 'http://localhost:2000/products.json/'
    products_data = JSON.parse(products_json)
    @products = Kaminari.paginate_array(products_data).page(params[:page]).per(9)
    @categories = Category.all
  end

  def show
    product_json = RestClient.get 'http://localhost:2000/products/1.json'
    @product = JSON.parse(product_json)
    # id = @product.first['id']
    @categories = Category.all
  end

end
