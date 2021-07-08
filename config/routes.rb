Rails.application.routes.draw do

  root "home#index", as: 'home'

  get "/video", to: "video#index"
  get "/login", to: "login#index"

  resources :documents


  resources :articles do
    resources :comments
  end
  #get "/about", to: "about#about"
  #get "/articles", to: "articles#index"

  #get "/login", to: "login#login"
end