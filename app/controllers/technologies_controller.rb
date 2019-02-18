class TechnologiesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @technologies = current_user.technologies
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

  private

  def tech_params
    params.require(:technology).permit(:name)
  end
end