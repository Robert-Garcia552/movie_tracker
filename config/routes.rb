Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :users, only: [ :new, :create, :edit ]
  
  # sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  # show all movies
  get '/movies' => 'movies#index'

  # favorites
  post '/watched_movies/add' => 'watched_movies#create'
  get '/watched_movies/delete' => 'watched_movies#destroy'

  # profile
  get '/profile' => 'profile#index'
end
