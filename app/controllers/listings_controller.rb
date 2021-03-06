class ListingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @listings = current_user.listings.includes(:technologies, :requirements, :company)
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
      redirect_to @listing, notice: "Listing updated"
    else
      render :edit
    end
  end

  def new
    @listing = current_user.listings.new
  end

  def create
    @listing = current_user.listings.new(listing_params)

    if @listing.save
      redirect_to @listing, notice: "Listing created"
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

  def next_status
    @listing = current_user.listings.find(params[:listing_id])
    @listing.next_status

    respond_to do |format|
      format.js { render template: "listings/kanban_status_change.js.erb", layout: false }
    end
  end

  def prev_status
    @listing = current_user.listings.find(params[:listing_id])
    @listing.prev_status

    respond_to do |format|
      format.js { render template: "listings/kanban_status_change.js.erb", layout: false }
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :company_id, :description, :url, :status, technology_ids: [])
  end
end
