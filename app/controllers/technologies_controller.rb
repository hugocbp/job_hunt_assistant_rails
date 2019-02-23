class TechnologiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @technologies = current_user.technologies
  end

  def show
    @technology = current_user.technologies.find(params[:id])
    @technology_companies = Listing.joins(:requirements).where(requirements: { technology_id: 11 }).select(:company_id).distinct
  end

  def new
    @technology = current_user.technologies.new
  end

  def create
    @technology = current_user.technologies.new(tech_params)

    respond_to do |format|
      if @technology.save
        format.html { redirect_to @technology, notice: "Technology created" }
        format.json { render json: { value: @technology.id, text: @technology.name } }
      else
        format.html { render :new }
        format.json { render json: { errors: @technology.errors.full_messages } }
      end

      # Handle very fast tab insertions on form
    rescue ActiveRecord::RecordNotUnique
      format.json { render json: { message: "Technology already created" } }
    end
  end

  def edit
    @technology = current_user.technologies.find(params[:id])
  end

  def update
    @technology = current_user.technologies.find(params[:id])
    if @technology.update(tech_params)
      redirect_to @technology, notice: "Technology updated"
    else
      render :edit
    end
  end

  def destroy
    @technology = current_user.technologies.find(params[:id])
    @technology.destroy
    redirect_to technologies_path, notice: "Technology deleted"
  end

  private

  def tech_params
    params.require(:technology).permit(:name)
  end
end
