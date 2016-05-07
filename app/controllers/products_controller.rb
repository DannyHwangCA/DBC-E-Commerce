class ProductsController < ApplicationController
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @category_id = params[:category_id]
    @products = Category.find(params[:category_id]).products.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @categories = Category.all
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      if cat_params.length > 0
        cat_params.each do |_, v|
          @product.categories_products.create(category_id: v.to_i)
        end
      else
        @product.categories_products.create(category_id: nil)
      end
      flash[:success] = "Product Created"
      redirect_to admin_path
    else
      flash[:danger] = @product.errors
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
    @all_cats = Category.all
    @category_id = @product.categories.map { |x| x.id }
  end

  def update
    @product = Product.find(params[:id])

    if @product
      @product.update_attributes(product_params)
      @product.categories_products.each { |record| record.destroy }
      cat_params.each do |_, v|
        @product.categories_products.create(category_id: v.to_i)
      end
      redirect_to admin_path
    else
      render 'edit'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to admin_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :stock)
  end

  def cat_params
    all_params = params.require(:product).permit!
    keys = all_params.keys - product_params.keys
    return all_params.select { |k, v| keys.include?(k) }
  end
end


