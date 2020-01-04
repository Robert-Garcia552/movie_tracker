class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :popularity
      t.integer :vote_count
      t.boolean :video
      t.string :poster_path
      t.boolean :adult
      t.string :backdrop_path
      t.string :original_language
      t.string :original_title
      t.integer :genre_ids, array: true, default: []
      t.string :title
      t.integer :vote_average
      t.string :overview
      t.string :release_date

      t.timestamps
    end
  end
end
