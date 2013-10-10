class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)


    # skill = Skill.find(params[:company][:skill_ids].last)
    # @company.skills << skill if skill


    skill_ids = params[:company][:skill_ids].map { |s| s if !s.blank? } # fix this list
    skill = Skill.find(skill_ids)
    #binding.pry
    skill.each do |s|
      @company.skills << s if !s.blank?
    end


    if @company.save
      redirect_to root_path, notice: "Your company information was recorded"
    else
      render action: "new"
    end
  end

  def update
    @company = Company.find(params[:id])
    binding.pry
    if @company.update(company_params)

      redirect_to @company, notice: "Your skills have been added to your profile successfully"
    else
      redirect_to @company, notice: "Skill was not created"
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
