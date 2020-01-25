class ProfileController < ApplicationController
  before_action :authorize

  def index
    @profile_movies ||= WatchedMovie.where(user_id: current_user.id)
    @watched_movies ||= @profile_movies&.map do |m|
      Movie.find(m.movie_id)
    end
    @favorite_movies ||= @profile_movies&.map do |m|
      Movie.find(m.movie_id) if m.favorite
    end
  end
end
