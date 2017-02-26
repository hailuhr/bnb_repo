class ListingsController < ApplicationController
  def index
    @listings = Listing.all

    @listing = Listing.new

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


  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      render json: @listing
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    head :no_content
  end


private

  def listing_params
    params.require(:listing).permit(:title, :price, :description)
  end
end
