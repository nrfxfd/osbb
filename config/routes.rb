Rails.application.routes.draw do

  get 'residents/index'
  get 'appartments/index'
  root "home#index", as: 'home'

  get "/video", to: "video#index"
  get "/login", to: "login#index"

  resources :documents
  resources :appartments
  resources :articles do
    resources :comments
  end

end