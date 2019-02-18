Rails.application.routes.draw do 
  devise_for :users
	
	resources :listings

  root 'pages#index'
end
