require 'json'
require 'rest-client'

class BookstoreService

  def initialize
    api_key = Rails.application.secrets.api_key
    secret_key = Rails.application.secrets.secret_key
    @token = ActionController::HttpAuthentication::Basic.encode_credentials(api_key, secret_key)
    @path = "http://localhost:2000/api/v1/"
  end

  def get_products
    api_call("products/")["products"]
  end

  def get_product(id)
    api_call("/products/#{id}/")["products"]
  end

  def get_categories
    api_call("/categories/")["categories"]
  end

  def get_category(id)
    api_call("/categories/#{id}/")["categories"]
  end

  def api_call(endpoint)
    url = @path + endpoint
    data = RestClient.get(url, { Authorization: @token })
    JSON.parse(data)
  end

end
