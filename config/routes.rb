Rails.application.routes.draw do
  resources :users
  resources :favourites
  resources :pictures

  root to: 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
