Rails.application.routes.draw do

  root "home#index", as: 'home'

  get '/admin', to: "admin#index"

  get "/video", to: "video#index"
  get "/login", to: "login#index"

  resources :documents

  resources :apartments do
  resources :residents
  end

  resources :articles do
    resources :comments
  end

end