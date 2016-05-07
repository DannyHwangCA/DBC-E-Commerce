class AdminsController < ApplicationController
# http_basic_authenticate_with name: "admin", password: "secret"

  def show
    @categories = Category.all
    @products = Product.all
  end

  def other
    @other_carts = CategoriesProduct.where(category_id: nil)
  end

end
