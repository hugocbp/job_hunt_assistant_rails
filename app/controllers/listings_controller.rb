class ListingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @listings = current_user.listings
  end

  def show
    @listing = current_user.listings.find(params[:id])
  end
  
  def edit
    @listing = current_user.listings.find(params[:id])
    @companies = current_user.companies.all
  end

  def update
    @listing = current_user.listings.find(params[:id])
    @companies = current_user.companies # Re-render in case of errors
    if @listing.update(listing_params)
      redirect_to @listing, notice: 'Listing updated'
    else
      render :edit
    end
  end

  def new
    @listing = current_user.listings.new
    @companies = current_user.companies
  end
  
  def create
    @listing = current_user.listings.new(listing_params)
    @companies = current_user.companies # Re-render in case of errors
    if @listing.save
      redirect_to @listing, notice: 'Listing created'
    else
      render :new
    end
  end

  def destroy
    @listing = current_user.listings.find(params[:id])
    @listing.destroy
    redirect_to listings_path, notice: "Listing deleted"
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :company_id, :description, :technologies)
  end
end
