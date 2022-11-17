class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def update
    respond_to do |format|
      if params[:commit] == 'Accepted'
        'accepted'
    elsif params[:commit] == 'Rejected'
        'rejected'
    end
  end
end
