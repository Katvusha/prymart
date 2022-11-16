class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to products_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :content, :photo)
  end
end
