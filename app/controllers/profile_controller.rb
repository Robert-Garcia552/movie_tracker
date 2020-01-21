class ProfileController < ApplicationController
  before_action :authorize

  def index
    favorites ||= Favorite.where(user_id: current_user.id)
    @favorite_movies ||= favorites.map do | f |
      Movie.find(f.movie_id)
    end
  end
end
