class ReviewsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @booking
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking_id = @booking.id
    authorize @review
    if @review.save
      flash[:notice] = "Your review has been submitted"
      redirect_to myprofile_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :testimonial)
  end
end
