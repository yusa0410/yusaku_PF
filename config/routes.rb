Rails.application.routes.draw do
  devise_for :users
  get '/' => 'homes#top'
  resources :users, only: [:show, :edit, :update, :index] do
    resources :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :movies, only: [:new, :show, :edit, :update, :index, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :movie_comments, only: [:create, :destroy]
  end

  get "search" => "searches#search"


end
