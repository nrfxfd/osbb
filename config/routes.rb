Rails.application.routes.draw do
  root "home#index", as: 'home'


  get 'residents/index'
  get "/video", to: "video#index"
  get "/login", to: "login#index"

  resources :documents
  resources :apartments
  resources :residents
  resources :articles do
    resources :comments
  end

end