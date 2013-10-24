class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to root_path, notice: "Your profile has been created."
    else
      render action: "new"
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :city, :state, :linkedin, :twitter, :github, :blog, :stackoverflow, :relocate)
  end
end
