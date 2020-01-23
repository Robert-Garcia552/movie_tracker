class WelcomeController < ApplicationController
    def index
        redirect_to profile_path if current_user
    end
end