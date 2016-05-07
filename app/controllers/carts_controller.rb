class CartsController < ApplicationController

  before_action :authorize
  before_action :correct_user

  def index
    @carts = @user.carts
  end

  def create
    @user.carts.find()


    new_item = @user.carts.create(cart_params)
    if new_item
      flash[:success] = "Added to shopping cart"
      redirect_to product_path(new_item.product_id)
    else
      flash[:danger] = new_item.errors
      redirect_to root_url
    end
  end

  def update
    @cart = @user.carts.find(params[:id])
    product = Product.find(@cart.product_id)
    if @cart && product
      if product.stock >= quantity_param['quantity'].to_i
        # stock_left = product.stock - quantity_param['quantity'].to_i
        if quantity_param['quantity']
          @cart.update_attributes(quantity_param)
        end
        # product.update_attributes(stock: stock_left)
      else
        flash[:error] = "Stock on this item is less than your request quantity"
      end

      redirect_link = user_carts_path(@user.id)
    else
      flash[:error] = "cart not found"
      redirect_link = root_url
    end

    respond_to do |format|
      format.html { redirect_to redirect_link }
      format.js
    end

  end

  def destroy
    cart = @user.carts.find(params[:id])
    cart.destroy
    @id = params[:id]

    respond_to do |format|
      format.html { redirect_to user_carts_path(@user.id) }
      format.js
    end

  end

  private

  def cart_params
    params.require(:cart).permit(:product_id)
  end

  def quantity_param
    params.require(:carts).permit(:quantity)
  end

  def correct_user
    @user = User.find(params[:user_id])
    unless current_user?(@user)
      flash[:error] = 'request perhibited'
      redirect_to root_url
    end
  end

end
