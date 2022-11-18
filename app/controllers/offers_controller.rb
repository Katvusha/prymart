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

  def authenticate
    redirect_to new_user_session_path unless current_user
  end
end
