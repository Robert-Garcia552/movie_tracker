class Favorite < ApplicationRecord
    validates :user_id, :movie_id, :presence => true, on: :create
    validates :movie_id, uniqueness: true
end
