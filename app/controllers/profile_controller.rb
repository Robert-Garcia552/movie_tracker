class ProfileController < ApplicationController
  before_action :authorize

  def index
    @profile_movies ||= current_user.watched_movies
    @watched_movies ||= @profile_movies&.map do |m|
      Movie.find(m.movie_id)
    end
    @favorite_movies ||= @profile_movies&.select{ |m| m.favorite }&.map do |m|
      Movie.find(m.movie_id)
    end
  end
end
