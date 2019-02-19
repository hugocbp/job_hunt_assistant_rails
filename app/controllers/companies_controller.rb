class CompaniesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @companies = current_user.companies.all
  end
end