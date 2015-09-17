Rails.application.routes.draw do
  devise_for :users
  root 'movies#index'
  resources :movies, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :pictures
end
