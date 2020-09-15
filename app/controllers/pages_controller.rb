class PagesController < ApplicationController
  def home
    @mentors = Mentor.all
  end
end
