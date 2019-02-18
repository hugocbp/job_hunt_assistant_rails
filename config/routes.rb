Rails.application.routes.draw do 
  devise_for :users
	
	resources :listings
  resources :technologies

  root 'pages#index'
end
