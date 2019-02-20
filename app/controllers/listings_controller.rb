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
    @listing.requirements.build
    @companies = current_user.companies
    @technologies = current_user.technologies
  end
  
  def create
    @listing = current_user.listings.new(listing_params)
    
    # Build requirements
    if params[:requirements] && params[:requirements].key?(:technology_id)
      params[:requirements][:technology_id].each do |tech_id|
        @listing.requirements.new(technology_id: tech_id)
      end
    end

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
    params.require(:listing).permit(:title, :company_id, :description, requirements_attributes: [ technology_id: [] ])
  end
end
