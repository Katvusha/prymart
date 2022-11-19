class SubcategoriesController < ApplicationController
  def index
    @subcategories = Subcategory.all
  end

  def show
    @Subcategory = Subcategory.find(params[:id])
  end
end
