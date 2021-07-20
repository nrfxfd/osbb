Rails.application.routes.draw do

  root "home#index", as: 'home'

  get '/admin', to: "admin#index"
  get "/login", to: "login#index"
  get "/video", to: "video#index"


  resources :documents

  resources :apartments do
  resources :residents
  end

  resources :articles do
    resources :comments
  end

end