class FavoritesController < ApplicationController  
  def new
    favorite = Favorite.new
  end
  
  def create
    favorite = Favorite.new(favorite_params)
    favorite.save

    respond_to do |format|
      format.json
    end
  end

  def destroy
    favorite = Favorite.find_by(movie_id: params[:movie_id].to_i).destroy
  end

  private

  def favorite_params
    params.require(:favorite).permit(
      :movie_id,
      :user_id
    )
  end
end
