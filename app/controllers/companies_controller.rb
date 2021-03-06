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

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)

      redirect_to @company, notice: "Your skills have been added to your profile successfully"
    else
      redirect_to @company, notice: "Skill was not created"
    end
  end

  def show
    @rating = Rating.new
    @company = Company.find(params[:id])
  end

  def index
    @companies = Company.all.sort_by! { |c| c.score }.reverse
  end

  private
  def company_params
    params.require(:company).permit(:name, :email, :city,
      :state, :description, :telecommute, :industry_id, :size,
      :year_founded, skill_ids: [])
  end
end
