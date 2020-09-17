class PagesController < ApplicationController
  include PgSearch::Model
  skip_before_action :authenticate_user!, only: :home
  
  def home
    @mentors = Mentor.all
  end

  def filter 
  end
end
