class ProfileController < ApplicationController
  before_action :authorize

  def index
    @profile_movies ||= current_user.watched_movies.includes(:movie)
    @watched_movies ||= @profile_movies.select{ |movie| !movie.favorite }
    @favorite_movies ||= @profile_movies.select{ |movie| movie.favorite }
  end
end
