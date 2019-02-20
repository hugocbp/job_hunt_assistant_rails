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

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company created' } 
        format.json { render json: { value: @company.id, text: @company.name } }
      else
        format.html { render :new }
        format.json { render json: { errors: @company.errors.full_messages } }
      end
    end
  end

  def edit
    @company = current_user.companies.find(params[:id])
  end

  def update
    @company = current_user.companies.find(params[:id])

    if @company.update(company_params)
      redirect_to @company, notice: 'Company updated'
    else
      render :edit
    end
  end

  def destroy
    @company = current_user.companies.find(params[:id])
    @company.destroy
    redirect_to companies_path, notice: 'Company deleted'
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end