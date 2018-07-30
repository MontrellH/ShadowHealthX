Rails.application.routes.draw do
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions
  resources :users
  resources :homepage
  resources :shelters
  resources :dogs

  get "/button/:id" => "homepage#button", as: 'button'
end
