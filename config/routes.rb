Rails.application.routes.draw do


  root "home#index", as: 'home'

  get "/admin", to: "admin#index"
  get "/video", to: "video#index"

  get "/login/:id", to: "login#show"
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :documents

  resources :apartments do
  resources :residents
  end

  resources :articles do
    resources :comments
  end

end