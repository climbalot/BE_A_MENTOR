class MentorsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @mentor = Mentor.find(params[:id])
    @user = @mentor.user
    @booking = Booking.new 
    @tab = params[:tab]
  end
end
