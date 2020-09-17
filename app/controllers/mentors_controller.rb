class MentorsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  skip_after_action :verify_authorized, only: [:new]

  def show
    @mentor = Mentor.find(params[:id])
    @user = @mentor.user
    @booking = Booking.new 
    @tab = params[:tab]
  end

  def new
    @mentor = Mentor.new
  end

  def create 
    @mentor = Mentor.new(mentor_params)
    @mentor.user_id = current_user.id
    authorize @mentor
    @mentor.save 

    if @mentor.save 
      redirect_to myprofile_path(current_user), notice: "You're a mentor now!"
    else 
      redirect_to :back, alert: "Something went wrong!"
    end
  end 

  private 

  def mentor_params
    params.require(:mentor).permit(:hourly_rate) 
  end
end
