class AddUserIdToWatchedMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :watched_movies, :user_id, :integer
  end
end
