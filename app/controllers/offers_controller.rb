class OffersController < ApplicationController
  def index
    redirect_to root_path unless current_user

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
    else
      render 'products/show', status: :unprocessable_entity
    end
  end

  def update
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

  private

  def offer_params
    params.require(:offer).permit(:status)
  end

  def statuses
    ['Accepted', 'Rejected']
  end
end
