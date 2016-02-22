Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  resources :users, only: [:show] do
    resources :configurations
  end
  resources :users do
    resources :amazon_statements
  end
end
