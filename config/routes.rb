Rails.application.routes.draw do 
  devise_for :users
	
	resources :listings
  resources :technologies
  resources :companies

  root 'pages#index'
end
