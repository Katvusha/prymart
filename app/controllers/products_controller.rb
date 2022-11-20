class ProductsController < ApplicationController
  before_action :authenticate, only: %i[new create]

  def index
    @products = Product.all
    @subcategories = Subcategory.all
    if params[:query].present?
      @products = Product.search_by_name_and_sub_category(params[:query])
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
    @offer = Offer.new
  end

  def new
    @subcategories = Subcategory.all
    @product = Product.new
  end

  def create
    @subcategories = Subcategory.all
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
    params.require(:product).permit(:name, :price, :quantity, :subcategory_id, :photo)
  end

  def authenticate
    if current_user
      ""
    else
      redirect_to new_user_session_path
      flash[:alert] = "You must be signed in to do this."
    end
  end
end
