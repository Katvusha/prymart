class OffersController < ApplicationController
  def index
    redirect_to root_path unless current_user
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
    respond_to do |format|
      if params[:commit] == 'Accepted'
        'accepted'
      elsif params[:commit] == 'Rejected'
        'rejected'
    end
  end
  private

  def offer_params
    params.require(:offer).permit(:status)
  end
  end
end
