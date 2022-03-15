class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:index,:show]
  before_action :check_is_admin, except: [:index, :show]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartLineItem.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product.id), notice:"Product successfully created$$"
    else
      render action: "new"
    end

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to products_path, notice: "Product updated successfully**"
    else
      render action: "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: "Product deleted successfully!!!"
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :description, :cod_eligible, :in_stock, :category_id)
  end
end
