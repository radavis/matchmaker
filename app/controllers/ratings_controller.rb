class RatingsController < ApplicationController

  def create
    @company = Company.find(params[:company_id])
    @rating = @company.ratings.find_or_initialize_by(user_id: current_user.id)
    @rating.value = rating_params[:value]
    if @rating.save

      flash[:notice] = "You have rated this company successfully"
      redirect_to @company
    else
      render :new
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:value, :company_id)
  end

end
