Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :users, only: [:show, :edit, :update, :index] do
    resources :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :movies, only: [:new, :show, :edit, :update, :index, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :movie_comments, only: [:create, :destroy]
  end

  resources :direct_messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]

  get "search" => "searches#search"
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'


end
