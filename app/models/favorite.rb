class Favorite < ApplicationRecord
    validates :user_id, :movie_id, :presence => true, on: :create
end
