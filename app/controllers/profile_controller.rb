class ProfileController < ApplicationController
  before_action :authorize

  def index
    @favorite_movies ||= WatchedMovie.where(user_id: current_user.id, favorite: true)&.map do |m|
      Movie.find(m.movie_id)
    end
    @watched_movies ||= Movie.joins("INNER JOIN watched_movies ON watched_movies.movie_id = movies.id")
  end
end
