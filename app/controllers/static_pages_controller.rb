class StaticPagesController < ApplicationController

  def welcome
    flash[:success] = "To login as admin, go to login page and type username: tim@tim.com,  password: timtim"
  end

end
