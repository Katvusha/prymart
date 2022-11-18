class ProductsController < ApplicationController
  def index
    if params[:query].present?
      # @products = Product.where(name: params[:query])
      @products = Product.search_by_name_and_category(params[:query])
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
    @offer = Offer.new
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
    params.require(:product).permit(:name, :price, :content, :photo, :category)
  end
end
