class MoviesController < ApplicationController
    def index
        @movies = Movie.all
        @favorite_movies_ids = WatchedMovie.where(user_id: current_user.id, favorite: true).map{ |m| m.movie_id }
    end
end
