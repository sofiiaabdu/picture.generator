Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

   get '/all_pictures/', to: 'pictures#all_pictures', as: 'all_pictures'

  resources :users
  resources :pictures

  resources :favourites

  root to: 'pictures#all_pictures'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
