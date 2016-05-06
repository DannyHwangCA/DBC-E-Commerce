class OrdersController < ApplicationController
  before_action :authorize
  before_action :correct_user

  def new
  end

  def create
    place_orders
  end

  private
  def order_params
    params.require(:orders).permit(:address, :phone)
  end

  def correct_user
    @user = User.find(params[:user_id])
    unless current_user?(@user)
      flash[:error] = 'request perhibited'
      redirect_to root_url
    end
  end

  def place_orders
    # create a container
    collection = []

    # making new orders all together
    @user.carts.each do |cart|
      target_product = cart.product
      target_product.update_attributes(stock: target_product.stock - cart.quantity)
      new_order = @user.orders.new(order_params)

      new_order.total      = cart.quantity * target_product.price
      new_order.quantity   = cart.quantity
      new_order.product_id = target_product.id

      collection << new_order
    end

    # checking if all orders are valid
    if collection.all? { |item| item.valid? }
      # if so save all
      collection.each { |item| item.save }
      # destroy things in shopping cart
      @user.carts.each { |item| item.destroy }
      # flash message
      flash[:success] = "Order placed"
    else
      flash[:error] = "Something went wrong, try again"
    end

    redirect_to user_carts_path(@user.id)
  end

end