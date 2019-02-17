Rails.application.routes.draw do 
  devise_for :users
	
	get 'listings', to: "listings#index"
	get 'listings/:id', to: "listings#show", as: 'listing'

  root 'pages#index'
end
