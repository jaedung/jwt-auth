Rails.application.routes.draw do
  root to: "main#index"

  post "/users/login", to: "users#login"
  get "/users/profile", to: "users#profile"
end
