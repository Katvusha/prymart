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
    # TODO: use devise to allocate user
    @product.user = User.last

    if @product.save
      redirect_to @product
    else
      pp @product.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :content, :photo)
  end
end
