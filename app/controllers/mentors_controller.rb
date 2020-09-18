class MentorsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  skip_after_action :authenticate_user!, only: :destroy, :raise => false
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
    mentor_topic_params[:mentor_topics].each do |topic|
      if topic.blank? == false
        @topic = Topic.find_by(name: topic)
        @mentor_topic = MentorTopic.new(mentor_id: @mentor.id, topic_id: @topic.id)
        @mentor_topic.save
      end
    end

    if @mentor.save
      redirect_to myprofile_path(current_user), notice: "You're a mentor now!"
    else
      redirect_to :back, alert: "Something went wrong!"
    end
  end

  def destroy 
    @mentor = Mentor.find(params[:id])
    authorize @mentor
    @mentor.destroy
    if @mentor.destroy 
      redirect_to root_path, notice: "You've successfully deleted your account."
    else 
      redirect_to user_path(@mentor.user), alert: "Something went wrong!"
    end
  end

  private

  def mentor_params
    params.require(:mentor).permit(:hourly_rate)
  end

  def mentor_topic_params
    params.require(:mentor).permit(:mentor_topics => [])
  end
end
