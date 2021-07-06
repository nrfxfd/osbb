Rails.application.routes.draw do
  root "home#home"

  get "/about", to: "about#about"
  get "/articles", to: "articles#index"
  get "/video", to: "video#video"
  get "/login", to: "login#login"
end