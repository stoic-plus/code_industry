Rails.application.routes.draw do
  get '/', to: "welcome#index"
  resources :topics
  resources :users, only: [:new, :create]
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/dashboard', to: "dashboard#index"
end
