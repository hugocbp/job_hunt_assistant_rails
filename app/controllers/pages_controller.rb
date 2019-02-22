class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def index
    if current_user
      redirect_to dashboard_path
    end
  end

  def dashboard
    @dashboard_data = {
      listings_count: current_user.listings.count,
      technologies_count: current_user.technologies.count,
      companies_count: current_user.companies.count,
    }
    @listings = current_user.listings
    @ranking_tech = current_user.technologies.left_joins(:listings)
      .group(:id)
      .order(Arel.sql("COUNT(technologies.id) DESC"))
      .limit(5)
    @ranking_company = current_user.companies.left_joins(:listings)
      .group(:id)
      .order(Arel.sql("COUNT(companies.id) DESC"))
      .limit(5)
  end
end
