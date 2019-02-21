Rails.application.routes.draw do
  devise_for :users

  get "/dashboard", to: "pages#dashboard", as: "dashboard"

  resources :listings do
    put "/next_status" => "listings#next_status"
    put "/prev_status" => "listings#prev_status"
  end
  resources :technologies
  resources :companies

  root "pages#index"
end
