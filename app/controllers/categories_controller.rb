class CategoriesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
   before_action :check_is_admin, except: [:index, :show]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.where("category_id = ?", params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice:"Category successfully created$$"
    else
      render action: 'new'
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to categories_path, notice:"Category updated successfully**"
    else
      render action: 'edit'
    end

  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice:"Category deleted successfully !!!!"
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end
end
