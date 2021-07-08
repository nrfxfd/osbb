Rails.application.routes.draw do

  root "home#index", as: 'home'

  get "/video", to: "video#index"
  get "/login", to: "login#index"

  resources :documents


  resources :articles do
    resources :comments
  end
 
end