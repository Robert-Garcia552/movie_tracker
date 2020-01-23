class ProfileController < ApplicationController
  before_action :authorize

  def index
    @watched_movies ||= WatchedMovie.where(user_id: current_user.id)&.map do |m|
      Movie.find(m.movie_id)
    end
    @favorite_movies ||= @watched_movies&.map do |m|
      Movie.find(m.movie_id) if m.favorite
    end
  end
end
