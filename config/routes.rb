Rails.application.routes.draw do
  get '/', to: "welcome#index"
  resources :topics
end
