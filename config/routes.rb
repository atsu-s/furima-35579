Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: "items#index"

  resources :items
  resources :buyers, only: [:new, :index, :create]
end
