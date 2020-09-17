class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

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
      @user.update(user_params)
      authorize @user 
      if @user.update(user_params)
        redirect_to myprofile_path
      else 
        render 'user/edit', alert: "Your booking was unsuccessful, please try again."
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
      params.require('user').permit(user: [:email, :name, :password, :job_title, :location, :industry_id, :description, :experience_years, :education])
    end
end
