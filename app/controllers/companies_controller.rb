class CompaniesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @companies = current_user.companies.all
  end

  def show
    @company = current_user.companies.find(params[:id])
  end

  def new
    @company = current_user.companies.new
  end

  def create
    @company = current_user.companies.new(company_params)

    if @company.save
      redirect_to @company, notice: 'Company created'
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end