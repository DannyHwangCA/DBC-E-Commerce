class OrdersController < ApplicationController
  before_action :authorize
  before_action :correct_user

  def new
  end

  def create

  end

  private
  def order_params
    params.require(:order).permit(:address, :phone)
  end

  def correct_user
    @user = User.find(params[:user_id])
    unless current_user?(@user)
      flash[:error] = 'request perhibited'
      redirect_to root_url
    end
  end

end


# @user.carts.each do |cart|
#   cart.product.update_attributes(stock: cart.product.stock - cart.quantity)
#   cart.destroy

#   @user.orders.create( product_id and everthing else)
# end