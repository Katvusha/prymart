class ApplicationController < ActionController::Base
  def index
    @offers = []

    current_user.products.each do |product|
      @offers << product.offers
    end
  end
end
