class WatchedMoviesController < ApplicationController  
  def new
    watched_movie = WatchedMovie.new
  end
  
  def create
    watched_movie = WatchedMovie.new(watched_movie_params)
    watched_movie.save

    respond_to do |format|
      format.json
    end
  end

  def update_favorite
    favorite = WatchedMovie.find_by(movie_id: watched_movie_params[:movie_id]).update_attribute(:favorite, watched_movie_params[:favorite])
  end

  def destroy
    watched_movie = WatchedMovie.find_by(watched_movie_params).destroy
  end

  private

  def watched_movie_params
    params.require(:watched_movie).permit(
      :movie_id,
      :user_id,
      :favorite
    )
  end  
end
