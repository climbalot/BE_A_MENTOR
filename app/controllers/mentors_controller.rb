class MentorsController < ApplicationController
  def show
    @mentor = Mentor.find(1)
  end
end
