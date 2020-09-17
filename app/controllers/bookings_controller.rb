require 'time'

class BookingsController < ApplicationController
    def create
        @mentor = Mentor.find(params[:mentor_id])
        convert_time_to_duration()
        @price = (@mentor.hourly_rate / 60) * @duration
        @booking = Booking.new(booking_params)
        @booking.user = current_user
        @booking.mentor = @mentor
        @booking.duration_in_minutes = @duration
        @booking.total_price = @price
            # user_id: @user.id,
            # mentor_id: @mentor.id,
            # duration_in_minutes: @duration,
            # total_price: @price)
        @booking.save if @duration > 0

        if @booking.save
          redirect_to mentor_path(@mentor, tab: 'booking'), notice: "You've successfully made a booking!"
        else
          redirect_to mentor_path(@mentor, tab: 'booking'), alert: "Your booking was unsuccessful, please try again."
        end

        # verification
        authorize @booking
    end

    private

    def booking_params
        params.require(:booking).permit(:date, :start_time, :end_time)
    end

    def convert_time_to_duration
        start_time = params[:booking][:start_time].split(':')
        start_time_hour = start_time[0].to_i
        start_time_minutes = start_time[1].to_i
        end_time = params[:booking][:end_time].split(':')
        end_time_hour = end_time[0].to_i
        end_time_minutes = end_time[1].to_i
        hours = end_time_hour - start_time_hour
        minutes = end_time_minutes - start_time_minutes
        @duration = (hours * 60) + minutes
    end
end
