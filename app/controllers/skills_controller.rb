class SkillsController < ApplicationController
  before_filter :load_skillable

  def index
    @skills = @skillable.skills
  end

  def new
    @skill = @skillable.skills.new
  end

  def create
    @skill = @skillable.skills.new(params[:skill_name])
    if @skill.save
      redirect_to @skillable, notice: "Skills created."
    else
      render :new
    end
  end

  private
  def load_skillable
    klass = [User, Company].detect { |c| params["#{c.name.underscore}_id"] }
    @skillable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
