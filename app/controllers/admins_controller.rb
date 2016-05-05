class AdminsController < ApplicationController
# http_basic_authenticate_with name: "admin", password: "secret"

  def show
    @categories = Category.all
    @products = Product.all
  end

end
