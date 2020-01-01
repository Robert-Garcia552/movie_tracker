class UsersController < ApplicationController
  def new
    user = User.new
  end

  def create 
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Welcome to Movie Tracker #{current_user.first_name}!"
      redirect_to root_path
    else 
      flash[:danger] = "Something went wrong please try again."
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, 
      :last_name,
      :email, 
      :password, 
      :password_confirmation
      )
  end
end
