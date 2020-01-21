class CreateWatchedMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :watched_movies do |t|
      t.integer :user_id
      t.integer :movie_id
      t.boolean :favorite, default: false

      t.timestamps
    end
  end
end
