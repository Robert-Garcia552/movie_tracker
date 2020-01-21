class WatchedMoviesController < ApplicationController  
  def new
    favorite = WatchedMovie.new
  end
  
  def create
    favorite = WatchedMovie.new(watched_movie_params)
    favorite.save

    respond_to do |format|
      format.json
    end
  end

  def destroy
    favorite = WatchedMovie.find_by(movie_id: params[:movie_id].to_i).destroy
  end

  private

  def watched_movie_params
    params.require(:watched_movie).permit(
      :movie_id,
      :user_id
    )
  end
end
