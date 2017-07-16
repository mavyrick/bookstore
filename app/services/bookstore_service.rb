require 'json'
require 'rest-client'
require 'kaminari'

class BookstoreService

    def index_product_call(params)
      products_response = RestClient.get 'http://localhost:2000/products/'
      products_data = JSON.parse(products_response)['products']
      products = Kaminari.paginate_array(products_data).page(params[:page]).per(9)
      return products
    end

    def cart_product_call
      products_response = RestClient.get 'http://localhost:2000/products/'
      products_data = JSON.parse(products_response)['products']
      return products_data
    end

    def index_category_call
      category_response = RestClient.get 'http://localhost:2000/categories/'
      category_data = JSON.parse(category_response)['categories']
      return category_data
    end

    def show_product_call(id)
      response = RestClient.get "http://localhost:2000/products/#{id}/"
      product_data = JSON.parse(response)['products']
      return product_data
    end

    def show_category_call(id)
      response = RestClient.get "http://localhost:2000/categories/#{id}/"
      category_data = JSON.parse(response)['categories']
      return category_data
    end

end
