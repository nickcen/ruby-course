Rails.application.routes.draw do
  resources :categories

  resources :sessions, only: [:index]
end
