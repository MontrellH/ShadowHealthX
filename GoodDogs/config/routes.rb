Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'users#index'
  post '/sessions' => 'sessions#create'
  post '/users' => 'users#create'
  post '/shelters' => 'shelters#create'
  get '/dashboard' => 'homepage#index'
  resources :shelters
  resources :dogs
end
