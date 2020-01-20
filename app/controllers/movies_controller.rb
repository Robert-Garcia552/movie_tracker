class MoviesController < ApplicationController
    def index
        @movies = Movie.all
        @favorite_movies_ids = Favorite.where(user_id: current_user.id).map{ |m| m.movie_id }
    end
end
