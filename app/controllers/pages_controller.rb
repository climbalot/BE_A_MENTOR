class PagesController < ApplicationController
  include PgSearch::Model
  skip_before_action :authenticate_user!, only: :home
  
  def home
    @mentors = Mentor.all
    if params[:country].present?
      @mentors = @mentors.joins(:user).where(users: {location: params[:country]})
    end

    if params[:industry].present?
      @mentors = @mentors.joins(user: :industry).where(industries: {industry_name: params[:industry]})
    end

    if params[:topic].present?
      @mentors = @mentors.joins(mentor_topics: :topic).where(topics: {name: params[:topic]})
    end
  end
end
