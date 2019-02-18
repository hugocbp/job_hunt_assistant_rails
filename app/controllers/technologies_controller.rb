class TechnologiesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @technologies = current_user.technologies
  end

  def show
    @technology = current_user.technologies.find(params[:id])
  end

  def new
    @technology = current_user.technologies.new
  end

  def create
    @technology = current_user.technologies.new(tech_params)

    if @technology.save
      redirect_to technologies_path, notice: 'Technology created'
    else
      render :new
    end
  end

  def edit
    @technology = current_user.technologies.find(params[:id])
  end

  def update
    @technology = current_user.technologies.find(params[:id])
    if @technology.update(tech_params)
      redirect_to technologies_path, notice: 'Technology update'
    else
      render :edit
    end
  end

  def destroy
    @technology = current_user.technologies.find(params[:id])
    @technology.destroy
    redirect_to technologies_path, notice: 'Technology deleted'
  end

  private

  def tech_params
    params.require(:technology).permit(:name)
  end
end