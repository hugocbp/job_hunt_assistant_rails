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
    if @listing.update(listing_params)
      redirect_to @listing, notice: 'Listing updated'
    else
      @companies = current_user.companies # Re-render in case of errors
      render :edit
    end
  end

  def new
    @listing = current_user.listings.new
  end
  
  def create
    @listing = current_user.listings.new(listing_params)
    
    if @listing.save
      redirect_to @listing, notice: 'Listing created'
    else
      # Re-render companies in case of errors
      @companies = current_user.companies
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
    params.require(:listing).permit(:title, :company_id, :description, :url,technology_ids: [])
  end
end
