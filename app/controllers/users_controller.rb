class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  skip_after_action :authenticate_user!, only: :destroy, :raise => false

  def show
      @user = User.find(params[:id])
  end

  def myprofile 
    @user = current_user
    authorize @user
  end

  def edit 
    @user = User.find(params[:id])
    authorize @user  
  end

  def update 
    @user = User.find(params[:id])
    authorize @user
    @user.update(user_params)
    if @user.save
      bypass_sign_in @user
      redirect_to myprofile_path, notice: "You've edited your profile successfully!"
    else 
      redirect_to myprofile_path, alert: "Something went wrong!"
    end
  end

  def destroy 
    @user = User.find(params[:id])
    @user.destroy
    if @user.destroy 
      redirect_to root_path, notice: "You've successfully deleted your account."
    else 
      redirect_to user_path(@user), alert: "Something went wrong!"
    end
  end

  private 

  def user_params 
    params.require('user').permit(:email, :name, :password, :job_title, :location, :industry_id, :description, :experience_years, :education)
  end
end
