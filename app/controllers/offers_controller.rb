class OffersController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @offer = Offer.new
  end

  def create
    @product = Product.find(params[:product_id])

    @offer = Offer.new(offer_params)
    @offer.product = @product
    @offer.status = :pending
    if @offer.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:status)
  end
end
