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

  # add favorite
  post '/favorite/add' => 'favorites#create'
end
