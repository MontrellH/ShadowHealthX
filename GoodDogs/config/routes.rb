Rails.application.routes.draw do
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource  :sessions
  resources :users
  resources :homepage
  resources :shelters
  resources :dogs

  post "/button/:id" => "homepage#button", as: 'button'

  resources :shelter_manipulations

end
