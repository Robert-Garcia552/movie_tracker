class AddReferenceToWatchedMovies < ActiveRecord::Migration[5.2]
  def up
    remove_column :watched_movies, :user_id
  end

  def down
    add_reference :watched_movies, :user
  end
end
