class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new

  end


  def create
  @listing = Listing.new(listing_params)

    if @listing.save
      render json: @listing
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

private

  def listing_params
    params.require(:listing).permit(:title, :amount, :date)
  end
end
