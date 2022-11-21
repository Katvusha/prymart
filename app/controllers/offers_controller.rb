class OffersController < ApplicationController
  before_action :authenticate

  def index
    @offers = Offer.all
  end

  def new
    @product = Product.find(params[:product_id])
    @offer = Offer.new
  end

  def create
    @product = Product.find(params[:product_id])

    @offer = Offer.new
    @offer.user = current_user
    @offer.product = @product
    @offer.status = :pending
    if @offer.save
      redirect_to root_path
      flash[:alert] = "Offer made succesfully. Please wait for the seller's reply."
    else
      render 'products/show', status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:id])
    @offer = Offer.find(params[:id])

    if statuses.include?(params[:commit])
      @offer.status = params[:commit].downcase.to_sym

      if @offer.save
        redirect_to product_offers_path(@offer.product_id)

      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    Offer.destroy(params[:id])
    redirect_to offers_path
  end

  private

  def offer_params
    params.require(:offer).permit(:status)
  end

  def statuses
    ['Accepted', 'Rejected']
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
