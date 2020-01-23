class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back #{current_user.first_name}"
      redirect_to profile_path
    else
      flash[:danger] = "Email and password combination not found."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logged out."
    redirect_to root_path
  end
end
