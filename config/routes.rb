Rails.application.routes.draw do 
  devise_for :users

  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

	resources :listings
  resources :technologies
  resources :companies

  root 'pages#index'
end
