Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  get '/pictures/', to: 'pictures#pictures', as: 'pictures'

  resources :users do
    resources :pictures
    resources :favourites
  end

  root to: 'pictures#pictures'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
