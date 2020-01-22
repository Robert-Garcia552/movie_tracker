class MoviesController < ApplicationController
    def index
        @movies = Movie.all
        @watched_movies_ids ||= current_user.watched_movies&.map{ |m| m.movie_id }
        @favorite_movies_ids ||= current_user.watched_movies&.map{ |m| m.movie_id if m.favorite }
    end
end
