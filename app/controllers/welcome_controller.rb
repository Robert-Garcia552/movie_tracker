class WelcomeController < ApplicationController
  def index
    redirect_to profile_path if current_user

    @movie_samples = Movie.limit(3)
  end
end