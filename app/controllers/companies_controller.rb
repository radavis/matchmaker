class CompaniesController < ApplicationController
  def new
    @company = Company.new

  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to root_path, notice: "Your company information was recorded"
    else
      render action: "new"
    end
  end

  def show
    @company = Company.find(params[:id])
    @skillable = @company
    @skills = @skillable.skills
    @skill = Skill.new
  end

  def index
  end

  private
  def company_params
    params.require(:company).permit(:name, :email, :city,
      :state, :description, :telecommute, :industry_id, :size,
      :year_founded)
  end
end
