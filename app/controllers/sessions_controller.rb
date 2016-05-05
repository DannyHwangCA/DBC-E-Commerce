class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_email(params['session']['email'])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params['session']['password'])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash[:error] = "Password or email not found"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end


end
