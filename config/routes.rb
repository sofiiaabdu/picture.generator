Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  resources :users
  resources :pictures
  resources :favourites

  root to: 'pictures#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
