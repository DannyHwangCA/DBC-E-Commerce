class CategoriesController < ApplicationController
  before_action :check_admin, only: [:new, :create]
  def index
    @categories = Category.all
  end

  def show
    category = Category.find(params[:id])
    unless category
      flash[:errors] = "Category not found"
      redirect_to root_url
    else
      @products = category.products
    end
  end

  def new
    @category = Category.new
  end

  def create
    Category.create(cat_params)
    redirect_to admin_path
  end

  def edit

  end

  def update

  end


  def destroy

  end

  private
  def cat_params
    params.require(:category).permit(:name)
  end

end
