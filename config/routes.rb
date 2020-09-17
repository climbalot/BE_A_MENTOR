Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :mentors, only: [:show] do
    resources :bookings, only: [:create]
  end
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :reviews, only: [:new, :create]
  get 'myprofile', to: 'users#myprofile'
  post 'filter', to: 'pages#filter'
end

