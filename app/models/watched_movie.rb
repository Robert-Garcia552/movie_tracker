class WatchedMovie < ApplicationRecord
    belongs_to :user
    belongs_to :movie

    validates :user_id, :movie_id, :presence => true, on: :create
    validates :movie_id, uniqueness: true
end
