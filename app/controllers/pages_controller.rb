class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  
  def index
  end

  def dashboard
    @dashboard_data = {
      listings_count: current_user.listings.count,
      technologies_count: current_user.technologies.count,
      companies_count: current_user.companies.count,
    }
  end
end
