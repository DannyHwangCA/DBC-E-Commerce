class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      flash[:success] = "User created"
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash[:danger] = user.errors
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @orders = @user.orders

  end


private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end


