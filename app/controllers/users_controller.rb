class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      ExampleMailer.sample_email(user).deliver
      flash[:success] = "User created"
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash[:danger] = user.errors
      render "new"
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
