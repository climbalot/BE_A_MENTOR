class MentorsController < ApplicationController
  def show
    @mentor = Mentor.find(params[:id])
    @user = @mentor.user
    @booking = Booking.new 
    @tab = params[:tab]
  end
end
